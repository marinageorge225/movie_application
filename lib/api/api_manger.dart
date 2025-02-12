import 'dart:convert';
import 'package:graduation_movie_app/api/api_constant.dart';
import 'package:graduation_movie_app/api/end_points.dart';
import 'package:http/http.dart' as http;
import '../model/LoginResponse.dart';
import '../model/MovieResponse.dart';

class ApiManager {
  final Uri url = Uri.parse(ApiConstant.urlLoginAuth);

  Future<LoginResponse> login(String email, String password) async {
    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": ApiConstant.contentType,
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );


      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        return LoginResponse(
          message: jsonDecode(response.body)['message']?.toString() ?? "Unknown error",
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw Exception('Error occurred while making API request: $e');
    }
  }

//https://yts.mx/api/v2/list_movies.json

  static Future<MovieResponse?> getMovies() async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.movieApi, {
      'sort_by': 'date_added',
      'order_by': 'desc',
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieResponse.fromJson(json);
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching movies: $e');
    }
  }

}
