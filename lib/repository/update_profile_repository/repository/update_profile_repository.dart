import '../../../model/GetProfileResponse.dart';

abstract class UpdateProfileRepository{
  Future <GetProfileResponse?> getProfile(String token);
  Future <GetProfileResponse?> updateProfile(String token, String name, String? phone, int? avatarId);
  Future <GetProfileResponse?> deleteProfile(String token);
}