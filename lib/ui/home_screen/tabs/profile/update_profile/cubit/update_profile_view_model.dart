import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/model/get_profile_response.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileStates>{
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedAvatar;

  UpdateProfileViewModel():super(UpdateProfileInitialState());

  Future getProfile()async{
    try {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.get("user_token").toString();
    var response = await ApiManager.getProfileInfo(token);
      nameController.text =response!.data!.name!;
      phoneController.text = response.data!.phone!;}
        catch (e){
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
        }
    }

  Future<void> updateProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token").toString();
      var response = await ApiManager.updateProfileInfo(
        token: token,
        name: nameController.text,
        phone: phoneController.text,
        avatarId: 2
      );
      emit(UpdateProfileSuccessState(successMsg: response!.message!));
    } catch (e) {
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

  void deleteProfile()async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token").toString();
      var response = await ApiManager.deleteProfileInfo(token);
      emit(UpdateProfileSuccessState(successMsg: response!.message!));
    }catch(e){
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

}