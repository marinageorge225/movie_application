import 'package:graduation_movie_app/model/movie_list_response.dart';
import 'package:graduation_movie_app/repository/movieList/dataSources/movie_list_remote_data_source.dart';
import 'package:graduation_movie_app/repository/movieList/repository/movie_List_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: MovieListRepository)
class MovieListRepositoryImpl implements MovieListRepository{
  MovieListRemoteDataSource remoteDataSource;
  MovieListRepositoryImpl({required this.remoteDataSource});
  @override
  Future<MovieListResponse?> getMovieListByGenre(String genre) async {
    var response = await remoteDataSource.getMovieListByGenre(genre);
    return response;
  }
}