import '../dataSourcesMovieDetails/source_remote_data_source.dart';
import '../../../../model/MovieDetailsResponse.dart';
import 'source_repository.dart';
class SourceRepositoryImpl extends SourceRepository {
  final SourceRemoteDataSource remoteDataSource;

  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    return await remoteDataSource.getMovieDetails(movieId);
  }
}
