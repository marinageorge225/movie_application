import 'package:graduation_movie_app/model/GetProfileResponse.dart';
import 'package:graduation_movie_app/repository/update_profile_repository/data_sources/update_profile_remote_data_source.dart';
import 'package:graduation_movie_app/repository/update_profile_repository/repository/update_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateProfileRepository)
class UpdateProfileRepositoryImpl implements UpdateProfileRepository{
  UpdateProfileRemoteDataSource remoteDataSource;
  UpdateProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<GetProfileResponse?> deleteProfile(String token) {
    return remoteDataSource.deleteProfile(token);
  }

  @override
  Future<GetProfileResponse?> getProfile(String token) {
    return remoteDataSource.getProfile(token);
  }

  @override
  Future<GetProfileResponse?> updateProfile(String token, String name, String? phone, int? avatarId) {
    return remoteDataSource.updateProfile(token, name, phone, avatarId);
  }
}