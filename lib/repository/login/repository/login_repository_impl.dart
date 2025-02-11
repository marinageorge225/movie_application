import 'package:graduation_movie_app/model/LoginResponse.dart';
import 'package:injectable/injectable.dart';

import '../data_source/login_remote_data_source.dart';
import 'login_repository.dart';
@Injectable(as:LoginRepository)
class LoginRepositoryImpl implements LoginRepository{
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<LoginResponse> login(String email, String password) {
   return loginRemoteDataSource.login(email, password);
  }

}