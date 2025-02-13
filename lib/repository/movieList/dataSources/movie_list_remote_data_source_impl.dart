import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/repository/movieList/dataSources/movie_list_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieListRemoteDataSource)
class MovieListRemoteDataSourceImpl implements MovieListRemoteDataSource{
  ApiManager apiManager;
  MovieListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<MovieListResponse?> getMovieListByGenre(String genre) async{
    var response = await apiManager.getMovieListByGenre(genre);
    return response;
  }

}