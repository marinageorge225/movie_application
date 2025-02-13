import '../../../model/LoginResponse.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
}