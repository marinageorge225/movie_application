import '../../../../model/MovieDetailsResponse.dart';
import '../../../core/api/api_manger.dart';
import 'movie_details_data_source.dart';

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  final ApiManager apiManager;

  MovieDetailsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      var response = await apiManager.getMovieDetails(movieId);
      return response;
    } catch (e) {
      print("Error fetching movie details: $e");
      return null;
    }
  }
}
