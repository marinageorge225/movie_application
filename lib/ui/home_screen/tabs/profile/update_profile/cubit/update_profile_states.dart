import 'package:flutter/cupertino.dart';

abstract class UpdateProfileStates{}
class UpdateProfileInitialState extends UpdateProfileStates{}
class LoadUserProfileState extends UpdateProfileStates{}
class DeleteProfileSuccessState extends UpdateProfileStates{
  String successMsg;
  DeleteProfileSuccessState({required this.successMsg});
}
class UpdateProfileSuccessState extends UpdateProfileStates{
  String successMsg;
  UpdateProfileSuccessState({required this.successMsg});
}
class ProfileErrorState extends UpdateProfileStates{
  String errorMsg;
  ProfileErrorState({required this.errorMsg});
}
