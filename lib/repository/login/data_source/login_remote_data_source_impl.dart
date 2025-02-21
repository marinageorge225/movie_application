import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/api/api_manger.dart';
import '../../../model/LoginResponse.dart';
import 'login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiManager apiManager;
  LoginRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      var response = await apiManager.login(email, password);

      if (response.token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.token!);
      }

      return response;
    } catch (e) {
      return LoginResponse(
        message: "Error in login: $e",
        statusCode: 500,
      );
    }
  }
}
