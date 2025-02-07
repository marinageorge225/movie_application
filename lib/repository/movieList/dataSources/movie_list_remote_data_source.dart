import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class MovieListRemoteDataSource{
  Future<MovieListResponse?> getMovieListByGenre(String genre);
}