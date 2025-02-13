import 'dart:convert';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:http/http.dart' as http;
import '../../model/MovieDetailsResponse.dart';
import 'api_constant.dart';
import 'end_points.dart';

class ApiManagerDetailsScreen {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      final url = Uri.parse("${ApiConstant.baseUrlDetailsMovie}$movieId&with_images=true");

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return MovieDetailsResponse.fromJson(jsonData);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
  Future<MovieListResponse> getMovieSuggestions(int movieId) async {
    Uri url = Uri.https(
      ApiConstant.movieListBaseServer,
      EndPoints.movieSuggestionApi,
      {'movie_id': movieId.toString()},
    );

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieListResponse.fromJson(json);
      } else {
        throw Exception("Failed to fetch suggestions: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred: ${e.toString()}");
    }
  }

}
