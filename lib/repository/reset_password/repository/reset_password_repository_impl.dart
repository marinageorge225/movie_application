import 'package:graduation_movie_app/model/LoginResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../model/reset_password_response.dart';
import '../data_source/reset_password_remote_data_source.dart';
import 'reset_password_repository.dart';
@Injectable(as:ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository{
  ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;
  ResetPasswordRepositoryImpl({required this.resetPasswordRemoteDataSource});
  @override
  Future<ResetPasswordResponse> resetPassword({required String token, required String newPassword,
    required String oldPassword}) {
  return
    resetPasswordRemoteDataSource.resetPassword(token: token,
        newPassword: newPassword, oldPassword: oldPassword)  ;

  }

}