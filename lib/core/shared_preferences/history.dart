import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../model/MovieListResponse.dart';

class HistoryStorage {
  static const String movieHistory = "movie_history_";

  static Future<void> saveToHistory(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();


    List<String> history = prefs.getStringList(userHistoryKey) ?? [];

    String movieJson = jsonEncode({
      "id": movie.id,
      "mediumCoverImage": movie.mediumCoverImage,
      "largeCoverImage": movie.largeCoverImage,
      "rating": movie.rating
    });

    if (!history.contains(movieJson)) {
      history.add(movieJson);
      await prefs.setStringList(userHistoryKey, history);
    }
  }

  static Future<List<Movie>> loadHistoryMovies() async {
    final prefs = await SharedPreferences.getInstance();


    List<String> history = prefs.getStringList(userHistoryKey) ?? [];

    List<Movie> movies = history.map((movieJson) {
      Map<String, dynamic> movieMap = jsonDecode(movieJson);
      return Movie(
        id: movieMap["id"],
        mediumCoverImage: movieMap["mediumCoverImage"],
        largeCoverImage: movieMap["largeCoverImage"],
        rating: movieMap["rating"],
      );
    }).toList();

    return movies;
  }
}
