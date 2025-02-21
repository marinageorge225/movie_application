
import '../../../model/MovieDetailsResponse.dart';
abstract class WatchListRepository {
  Future<void> addToWatchlist(MovieDetailsResponse movie, String token);
  Future<void> removeFromWatchlist(String movieId, String token);
  Future<List<MovieDetailsResponse>> getWatchlist(String token);
  Future<bool> isMovieInWatchlist(String movieId, String token);
}