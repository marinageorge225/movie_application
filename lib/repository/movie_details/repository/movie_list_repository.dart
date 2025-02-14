import '../../../../model/MovieDetailsResponse.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId);
}
