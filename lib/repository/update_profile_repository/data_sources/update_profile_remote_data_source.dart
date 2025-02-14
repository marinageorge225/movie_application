import '../../../model/get_profile_response.dart';

abstract class UpdateProfileRemoteDataSource{
  Future <GetProfileResponse?> getProfile(String token);
  Future <GetProfileResponse?> updateProfile(String token, String name, String? phone, int? avatarId);
  Future <GetProfileResponse?> deleteProfile(String token);
}