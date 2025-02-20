import '../../../../../../model/GetProfileResponse.dart';
import '../../../../../../model/MovieListResponse.dart';


abstract class UpdateProfileStates{}
class UpdateProfileInitialState extends UpdateProfileStates{}
class LoadProfileDataState extends UpdateProfileStates{

}
class GetProfileDataState extends UpdateProfileStates{
  UserData data;
  List<Movie> historyMovies;
  GetProfileDataState({required this.data,required this.historyMovies});}

class UpdateProfileSuccessState extends UpdateProfileStates{
  String successMsg;
  UpdateProfileSuccessState({required this.successMsg});
}
class UpdateProfileErrorState extends UpdateProfileStates{
  String errorMsg;
  UpdateProfileErrorState({required this.errorMsg});
}



