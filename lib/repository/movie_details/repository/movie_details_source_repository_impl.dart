import '../dataSourcesMovieDetails/movie_details_data_source.dart';
import '../../../../model/MovieDetailsResponse.dart';
import 'movie_list_repository.dart';
class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDataSource;

  MovieDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    return await remoteDataSource.getMovieDetails(movieId);
  }
}
