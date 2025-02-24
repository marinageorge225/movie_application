
import 'package:graduation_movie_app/repository/watch_list/repository/watch_List_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../model/MovieDetailsResponse.dart';
import '../dataSources/watch_list_remote_data_source.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl implements WatchListRepository {
  final WatchListRemoteDataSource remoteDataSource;
  WatchListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addToWatchlist(String token, Map<String, dynamic> movieData) async{
  return await remoteDataSource.addToWatchlist(token, movieData);
  }

  @override
  Future<List<Map<String, dynamic>>> getWatchlist(String token) async {
    return await remoteDataSource.getWatchlist(token);
  }

  @override
  Future<bool> isMovieInWatchlist(String token, String movieId) async {
    return await remoteDataSource.isMovieInWatchlist(token, movieId);
  }

  @override
  Future<void> removeFromWatchlist(String token, String movieId) async {
    return await remoteDataSource.removeFromWatchlist(token, movieId);
  }

}
