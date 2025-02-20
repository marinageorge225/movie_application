import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/repository/update_profile_repository/repository/update_profile_repository.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/shared_preferences/history.dart';
import '../../../../../../core/utils/assets_manager.dart';

@injectable
class UpdateProfileViewModel extends Cubit<UpdateProfileStates>{
  UpdateProfileRepository updateProfileRepository;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedAvatar;
  int avatarId = 0;

  UpdateProfileViewModel({required this.updateProfileRepository}):super(UpdateProfileInitialState());

  Future getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token") ?? "";

      var response = await updateProfileRepository.getProfile(token);

      nameController.text = response!.data!.name!;
      phoneController.text = response.data!.phone!;
      avatarId = response.data!.avaterId!;
      selectedAvatar = getAvatarImage(avatarId);

      emit(LoadProfileDataState());
    } catch (e) {
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

  Future getProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token") ?? "";

      var response = await updateProfileRepository.getProfile(token);

      List<Movie> historyMovies = await HistoryStorage.loadHistoryMovies();

      emit(GetProfileDataState(data: response!.data!, historyMovies: historyMovies));
    } catch (e) {
      emit(UpdateProfileErrorState(errorMsg: e.toString()));
    }
  }

  Future<void> updateProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("user_token").toString();
      var response = await updateProfileRepository.updateProfile(
          token,
          nameController.text,
          phoneController.text,
          avatarId);

      selectedAvatar = getAvatarImage(avatarId);

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

  String getAvatarImage(int id) {
    List<String> avatars = [
      AssetsManager.avatar1,
      AssetsManager.avatar2,
      AssetsManager.avatar3,
      AssetsManager.avatar4,
      AssetsManager.avatar5,
      AssetsManager.avatar6,
      AssetsManager.avatar7,
      AssetsManager.avatar8,
      AssetsManager.avatar9,
    ];

    int index = (id - 1).clamp(0, avatars.length - 1);
    return avatars[index];
  }

  int getAvatarId(String imagePath) {
    List<String> avatars = [
      AssetsManager.avatar1,
      AssetsManager.avatar2,
      AssetsManager.avatar3,
      AssetsManager.avatar4,
      AssetsManager.avatar5,
      AssetsManager.avatar6,
      AssetsManager.avatar7,
      AssetsManager.avatar8,
      AssetsManager.avatar9,
    ];

    int index = avatars.indexOf(imagePath) + 1; // IDs start from 1
    return index;
  }


}