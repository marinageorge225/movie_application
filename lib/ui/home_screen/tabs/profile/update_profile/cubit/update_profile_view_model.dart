import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/update_profile_repository/repository/update_profile_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class UpdateProfileViewModel extends Cubit<UpdateProfileStates>{
  UpdateProfileRepository updateProfileRepository;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedAvatar;

  UpdateProfileViewModel({required this.updateProfileRepository}):super(UpdateProfileInitialState());

  Future getProfile()async{
    try {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.get("user_token").toString();
    var response = await updateProfileRepository.getProfile(token);
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
      var response = await updateProfileRepository.updateProfile(token, nameController.text, phoneController.text, 2);

    //   token: token,
    // name: nameController.text,
    // phone: phoneController.text,
    // avatarId: 2
      emit(UpdateProfileSuccessState(successMsg: response!.message!));
    } catch (e) {
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

  void deleteProfile()async{
    try{
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token").toString();
      var response = await updateProfileRepository.deleteProfile(token);
      emit(UpdateProfileSuccessState(successMsg: response!.message!));
    }catch(e){
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

}