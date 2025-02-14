import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/model/GetProfileResponse.dart';
import 'package:graduation_movie_app/repository/update_profile_repository/data_sources/update_profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource{
  ApiManager apiManager;
  UpdateProfileRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<GetProfileResponse?> deleteProfile(String token) {
    return apiManager.deleteProfileInfo(token);
  }

  @override
  Future<GetProfileResponse?> getProfile(String token) {
    return apiManager.getProfileInfo(token);
  }

  @override
  Future<GetProfileResponse?> updateProfile(String token, String name, String? phone, int? avatarId) {
    return apiManager.updateProfileInfo(token: token, name: name,phone: phone,avatarId: avatarId);
  }

}