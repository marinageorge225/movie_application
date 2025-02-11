import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/MovieDetailsResponse.dart';
import 'api_constant.dart';

class ApiManagerDetailsScreen {
  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      final url = Uri.parse("${ApiConstant.baseUrlDetailsMovie}$movieId");

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
}
