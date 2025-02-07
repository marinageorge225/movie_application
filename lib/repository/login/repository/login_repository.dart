import '../../../model/LoginResponse.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(String email, String password);
}