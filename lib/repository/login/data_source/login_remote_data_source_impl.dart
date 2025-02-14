import 'package:graduation_movie_app/model/LoginResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_manger.dart';
import 'login_remote_data_source.dart';
@Injectable(as:LoginRemoteDataSource )
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  ApiManager apiManager;
  LoginRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<LoginResponse> login(String email, String password) {
   var response= apiManager.login(email, password);
   return response;
    }

}