
import '../../../model/user_model_register.dart';

abstract class RegisterRemoteDataSource{
  Future<UserModel> registerUser(UserModel user) ;
}