import 'package:shared_preferences/shared_preferences.dart';

class WatchlistService {
  static Future<void> saveMovieToWatchlist(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> watchlist = prefs.getStringList('watchlist') ?? [];

    if (watchlist.contains(movieId)) {
      watchlist.remove(movieId);
    } else {
      watchlist.add(movieId);
    }

    await prefs.setStringList('watchlist', watchlist);
  }



  static Future<List<String>> getWatchlistMovies() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('watchlist') ?? [];
  }
}
