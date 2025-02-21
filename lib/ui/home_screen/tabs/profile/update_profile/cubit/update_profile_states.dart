import '../../../../../../model/GetProfileResponse.dart';
import '../../../../../../model/MovieListResponse.dart';


abstract class ProfileStates{}
class UpdateProfileInitialState extends ProfileStates{}
class LoadProfileDataState extends ProfileStates{

}
class GetProfileDataState extends ProfileStates{
  UserData data;
  List<Movie> historyMovies;
  GetProfileDataState({required this.data,required this.historyMovies});}
class GetProfileErrorState extends ProfileStates{
  String errorMsg;
  GetProfileErrorState({required this.errorMsg});
}

class UpdateProfileSuccessState extends ProfileStates{
  String successMsg;
  UpdateProfileSuccessState({required this.successMsg});
}
class UpdateProfileErrorState extends ProfileStates{
  String errorMsg;
  UpdateProfileErrorState({required this.errorMsg});
}



