import '../../../model/LoginResponse.dart';
import '../../../model/reset_password_response.dart';

abstract class ResetPasswordRepository {
  Future<ResetPasswordResponse> resetPassword({ required String token,required String newPassword,required String oldPassword});


}