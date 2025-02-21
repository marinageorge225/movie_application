
  import '../../../core/api/api_manger.dart';
  import '../../../model/MovieDetailsResponse.dart';
  import 'watch_list_remote_data_source.dart';
  import 'package:injectable/injectable.dart';

  @Injectable(as: WatchListRemoteDataSource)
  class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final ApiManager apiManager;

  WatchListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<void> addToWatchlist(MovieDetailsResponse movie, String token) async {
  await apiManager.addToWatchlist(movie.toJson(), token);
  }

  @override
  Future<void> removeFromWatchlist(String movieId, String token) async {
  await apiManager.removeFromWatchlist(movieId, token);
  }

  @override
  Future<List<MovieDetailsResponse>> getWatchlist(String token) async {
  var response = await apiManager.getWatchlist(token);
  return response.map((e) => MovieDetailsResponse.fromJson(e)).toList();
  }

  @override
  Future<bool> isMovieInWatchlist(String movieId, String token) async {
  return await apiManager.isMovieInWatchlist(movieId, token);
  }
  }
