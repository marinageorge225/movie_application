abstract class UpdateProfileStates{}
class UpdateProfileInitialState extends UpdateProfileStates{}

class UpdateProfileSuccessState extends UpdateProfileStates{
  String successMsg;
  UpdateProfileSuccessState({required this.successMsg});
}
class UpdateProfileErrorState extends UpdateProfileStates{
  String errorMsg;
  UpdateProfileErrorState({required this.errorMsg});
}

