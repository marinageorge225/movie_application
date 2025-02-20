 import 'package:graduation_movie_app/repository/watch_list/dataSources/watch_list_remote_data_source.dart';
import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_manger.dart';

@Injectable(as: WatchListRemoteDataSource)
class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final ApiManager apiManager;

  WatchListRemoteDataSourceImpl( this.apiManager );

  @override
  Future<MovieDetailsResponse?> addMovieToFavorites(Map<String, dynamic> movieData, String token) {
    return apiManager.addMovieToFavorites(movieData, token);
  }

  @override
  Future<bool> removeMovieFromFavorites(String movieId, String token) {
    return apiManager.removeMovieFromFavorites(movieId, token);
  }

  @override
  Future<List<MovieDetailsResponse>?> getAllFavoriteMovies(String token) {
    return apiManager.getAllFavoriteMovies(token);
  }

  @override
  Future<bool> isMovieFavorite(String movieId, String token) {
    return apiManager.isMovieFavorite(movieId, token);
  }
}
