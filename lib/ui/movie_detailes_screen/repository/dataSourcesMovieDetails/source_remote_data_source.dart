import '../../../../model/MovieDetailsResponse.dart';

abstract class SourceRemoteDataSource {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId);
}
