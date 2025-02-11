import '../../../../core/api/api_manager_details_screen.dart';
import '../../../../model/MovieDetailsResponse.dart';
import 'source_remote_data_source.dart';

class SourceRemoteDataSourceImpl extends SourceRemoteDataSource {
  final ApiManagerDetailsScreen apiManagerDetailsScreen;

  SourceRemoteDataSourceImpl({required this.apiManagerDetailsScreen});

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      var response = await apiManagerDetailsScreen.getMovieDetails(movieId);
      return response;
    } catch (e) {
      print("Error fetching movie details: $e");
      return null;
    }
  }
}
