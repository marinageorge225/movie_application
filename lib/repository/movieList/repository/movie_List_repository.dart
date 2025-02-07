import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class MovieListRepository{
  Future<MovieListResponse?> getMovieListByGenre(String genre);
}