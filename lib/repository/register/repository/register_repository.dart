import '../../../model/user_model_register.dart';

abstract class RegisterRepository{
  Future<UserModel> registerUser(UserModel user) ;
}