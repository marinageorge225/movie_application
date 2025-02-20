import 'package:graduation_movie_app/repository/watch_list/dataSources/watch_list_remote_data_source.dart';
import 'package:graduation_movie_app/repository/watch_list/repository/watch_list_repository.dart';
import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl implements WatchListRepository {
  final WatchListRemoteDataSource remoteDataSource;

  WatchListRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetailsResponse?> addMovieToFavorites(Map<String, dynamic> movieData, String token) {
    return remoteDataSource.addMovieToFavorites(movieData, token);
  }

  @override
  Future<bool> removeMovieFromFavorites(String movieId, String token) {
    return remoteDataSource.removeMovieFromFavorites(movieId, token);
  }

  @override
  Future<List<MovieDetailsResponse>?> getAllFavoriteMovies(String token) {
    return remoteDataSource.getAllFavoriteMovies(token);
  }

  @override
  Future<bool> isMovieFavorite(String movieId, String token) {
    return remoteDataSource.isMovieFavorite(movieId, token);
  }
}
