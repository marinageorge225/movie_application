import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';

abstract class WatchListRemoteDataSource {
  Future<MovieDetailsResponse?> addMovieToFavorites(Map<String, dynamic> movieData, String token);
  Future<bool> removeMovieFromFavorites(String movieId, String token);
  Future<List<MovieDetailsResponse>?> getAllFavoriteMovies(String token);
  Future<bool> isMovieFavorite(String movieId, String token);
}
