
  import '../../../core/api/api_manger.dart';
  import '../../../model/MovieDetailsResponse.dart';
  import 'watch_list_remote_data_source.dart';
  import 'package:injectable/injectable.dart';

  @Injectable(as: WatchListRemoteDataSource)
  class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final ApiManager apiManager;

  WatchListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<void> addToWatchlist(String token, Map<String, dynamic> movieData) async {
     return await apiManager.addToWatchlist(token, movieData);
  }

  @override
  Future<List<Map<String, dynamic>>> getWatchlist(String token) async {
    return await apiManager.getWatchlist(token);
  }

  @override
  Future<bool> isMovieInWatchlist(String token, String movieId) async {
    return await apiManager.isMovieInWatchlist(token, movieId);
  }

  @override
  Future<void> removeFromWatchlist(String token, String movieId) async {
    return await apiManager.removeFromWatchlist(token, movieId);
  }

  }
