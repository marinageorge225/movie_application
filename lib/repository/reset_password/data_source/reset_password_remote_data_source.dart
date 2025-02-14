import '../../../model/LoginResponse.dart';
import '../../../model/ResetPasswordResponse.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<ResetPasswordResponse> resetPassword({ required String token,required String newPassword,required String oldPassword});

}