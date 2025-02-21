
import 'package:graduation_movie_app/repository/watch_list/repository/watch_List_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../model/MovieDetailsResponse.dart';
import '../dataSources/watch_list_remote_data_source.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl implements WatchListRepository {
  final WatchListRemoteDataSource remoteDataSource;
  WatchListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addToWatchlist(MovieDetailsResponse movie, String token) {
   return remoteDataSource.addToWatchlist(movie, token);
  }

  @override
  Future<List<MovieDetailsResponse>> getWatchlist(String token) {
    return remoteDataSource.getWatchlist(token);
  }

  @override
  Future<bool> isMovieInWatchlist(String movieId, String token) {
     return remoteDataSource.isMovieInWatchlist(movieId, token);
  }

  @override
  Future<void> removeFromWatchlist(String movieId, String token) {
     return remoteDataSource.removeFromWatchlist(movieId, token);
  }
 
}
