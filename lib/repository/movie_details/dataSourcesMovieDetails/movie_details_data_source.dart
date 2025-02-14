import '../../../../model/MovieDetailsResponse.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId);
}
