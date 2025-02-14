import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/model/user_model_register.dart';
import 'package:graduation_movie_app/repository/register/data_source/register_remote_data_source.dart';

import '../../../core/api/api_service_register.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  ApiManager apiManager;
  RegisterRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<UserModel> registerUser(UserModel user) {
var response = apiManager.registerUser(user);
return response;
  }
}