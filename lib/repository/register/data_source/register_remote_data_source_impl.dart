import 'package:graduation_movie_app/model/user_model_register.dart';
import 'package:graduation_movie_app/repository/register/data_source/register_remote_data_source.dart';

import '../../../core/api/api_service_register.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  ApiService apiService;
  RegisterRemoteDataSourceImpl({required this.apiService});
  @override
  Future<UserModel> registerUser(UserModel user) {
var response = apiService.registerUser(user);
return response;
  }
}