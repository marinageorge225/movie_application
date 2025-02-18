import '../../../../../../model/GetProfileResponse.dart';

abstract class UpdateProfileStates{}
class UpdateProfileInitialState extends UpdateProfileStates{}
class LoadProfileDataState extends UpdateProfileStates{
  Data data;
  LoadProfileDataState({required this.data});}

class UpdateProfileSuccessState extends UpdateProfileStates{
  String successMsg;
  UpdateProfileSuccessState({required this.successMsg});
}
class UpdateProfileErrorState extends UpdateProfileStates{
  String errorMsg;
  UpdateProfileErrorState({required this.errorMsg});
}

