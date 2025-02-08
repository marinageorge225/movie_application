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

  UpdateProfileViewModel():super(UpdateProfileInitialState());

  Future getProfile()async{
    final prefs = await SharedPreferences.getInstance();
    try {
      emit(UpdateProfileInitialState());
    var response = await ApiManager.getProfileInfo(prefs.get("user_token").toString());
      nameController = TextEditingController(text: response!.data!.name!);
      phoneController = TextEditingController(text: response.data!.phone!);
      emit(LoadUserProfileState());}
        catch (e){
      emit(ProfileErrorState(errorMsg: e.toString()));
        }
    }

  Future<void> updateProfile() async {
    try {
      emit(LoadUserProfileState());

      final prefs = await SharedPreferences.getInstance();

      var response = await ApiManager.updateProfileInfo(
        token: prefs.getString("user_token").toString(),
        name: nameController.text,
        phone: phoneController.text,
      );

      if (response != null) {
        emit(UpdateProfileSuccessState(successMsg: response.message!));
      } else {
        emit(ProfileErrorState(errorMsg: response!.message!));
      }
    } catch (e) {
      emit(ProfileErrorState(errorMsg: e.toString()));
    }
  }  void deleteProfile(){}
  void saveAvatarImage(){}
}