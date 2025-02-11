import 'package:graduation_movie_app/model/movie_list_response.dart';

abstract class MovieListRemoteDataSource{
  Future<MovieListResponse?> getMovieListByGenre(String genre);
}