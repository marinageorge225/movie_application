
 abstract class WatchListRepository {
  Future<void> addToWatchlist(String token, Map<String, dynamic> movieData) ;
  Future<void> removeFromWatchlist(String token, String movieId);
  Future<List<Map<String, dynamic>>> getWatchlist(String token);
  Future<bool> isMovieInWatchlist(String token, String movieId);
}