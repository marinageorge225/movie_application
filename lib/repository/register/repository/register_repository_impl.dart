import 'package:graduation_movie_app/model/user_model_register.dart';
import 'package:graduation_movie_app/repository/register/repository/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/register_remote_data_source.dart';
@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository{
  RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepositoryImpl({required this.registerRemoteDataSource});
  @override
  Future<UserModel> registerUser(UserModel user)async {
     var response =await registerRemoteDataSource.registerUser(user);
     return response;
  }

}