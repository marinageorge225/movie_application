import '../../../../model/MovieDetailsResponse.dart';

abstract class SourceRepository {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId);
}
