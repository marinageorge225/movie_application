import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/model/GetProfileResponse.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileStates>{
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedAvatar;

  UpdateProfileViewModel():super(LoadUserProfileState());

  Future<String?> getToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<GetProfileResponse?> getProfile()async{
    //print("enteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeredddddddddddddddd");

    print("tooooooooooooooooooooooooken ${await getToken()}");
    //if(token != null) {
      print("enteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeredddddddddddddddd");
      var response = await ApiManager.getProfileInfo('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTU1ZjcyZTMxYzUwMjhjMmYwNzMzYSIsImVtYWlsIjoicm93YW5zaGVyaWYxODJAZ21haWwuY29tIiwiaWF0IjoxNzM4OTQ1MDA5fQ.ixyD14RvH_FbUyrhJsCGkTrfJCOCHHd4dNb_vXd8QvY');
      nameController = TextEditingController(text: response!.data!.name!);
      phoneController = TextEditingController(text: response.data!.phone!);
      print("user name ${response.data!.name!}");
      print("user phone ${response.data!.phone!}");
      emit(LoadUserProfileState());
    //}
  }
  void updateProfile(){

  }
  void deleteProfile(){}
  void saveAvatarImage(){}
}