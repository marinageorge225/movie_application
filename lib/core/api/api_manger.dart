import 'dart:convert';
import 'package:graduation_movie_app/model/MovieDetailsResponse.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/model/user_model_register.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../model/GetProfileResponse.dart';
import '../../model/LoginResponse.dart';
import 'end_points.dart';
import 'package:graduation_movie_app/core/api/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
@singleton
class ApiManager {
  Future<UserModel> registerUser(UserModel user) async {
    final url = Uri.parse(ApiConstants.baseUrlRegister);
    final jsonData = jsonEncode(user.toJson());

    print("  Sending data to API: $jsonData");

    final response = await http.post(
      url,
      headers: {'Content-Type': ApiConstants.contentType},
      body: jsonData,
    );

    print("****&&  Response Status Code: ${response.statusCode}");
    print("******&&  Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('  Failed to register user: ${response.statusCode}, '
          'Body: ${response.body}');
    }
  }




  final Uri url = Uri.parse(ApiConstants.urlLoginAuth);

  Future<LoginResponse> login(String email, String password) async {
    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": ApiConstants.contentType,
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));

        if (loginResponse.token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginResponse.token!);
        }

        return loginResponse;
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



  Future<MovieListResponse?> getMovieListByGenre(String genre) async {
    Uri url = Uri.https(ApiConstants.movieListBaseServer, EndPoints.listMoviesApi,
    {'genre' : genre, 'limit' : '50', 'page' : '1'});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MovieListResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

//https://yts.mx/api/v2/list_movies.json

  Future<MovieListResponse?> getMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.listMoviesApi, {
      'sort_by': 'date_added',
      'order_by': 'desc',
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieListResponse.fromJson(json);
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw e;
    }
  }
  Future<GetProfileResponse?> getProfileInfo(String token)async{
    Uri url = Uri.https(ApiConstants.profileBaseUrl, EndPoints.profileApi);
    try {
      var response = await http.get(url,
          headers: {
            "Authorization": "Bearer $token",
          });
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return GetProfileResponse.fromJson(json);
    }catch(e){
      print(e.toString());
      throw e;

    }
  }


  Future<GetProfileResponse?> updateProfileInfo({required String token,
  String? name,
  String? phone,
  int? avatarId}) async{
    Uri url = Uri.https(ApiConstants.profileBaseUrl, EndPoints.profileApi);
    try{
      var response = await http.patch(
          url,
          headers: {
            'Authorization': "Bearer $token",
            'Content-Type': ApiConstants.contentType,
          },
          body: jsonEncode({
            "name" : name,
            "phone" : phone,
            "avaterId" : avatarId
          })
      );

      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return GetProfileResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  Future<GetProfileResponse?> deleteProfileInfo(String token)async{
    Uri url = Uri.https(ApiConstants.profileBaseUrl, EndPoints.profileApi);

    try {
      var response = await http.delete(url,
          headers: {'Authorization' : "Bearer $token",
            "Content-Type": ApiConstants.contentType,});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return GetProfileResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrlDetailsMovie}$movieId&with_images=true&with_cast=true");

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
      ApiConstants.movieListBaseServer,
      EndPoints.movieSuggestionApi,
      {'movie_id': movieId.toString(),},
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


///////////////////////////


  final String baseUrl = "https://route-movie-apis.vercel.app/favorites";

  Future<void> addToWatchlist(Map<String, dynamic> movieData, String token) async {
    Uri url = Uri.parse("$baseUrl/add");

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(movieData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add movie to watchlist');
    }
  }

  Future<void> removeFromWatchlist(String movieId, String token) async {
    Uri url = Uri.parse("$baseUrl/remove/$movieId");

    var response = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove movie from watchlist');
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlist(String token) async {
    Uri url = Uri.parse("$baseUrl/all");

    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to fetch watchlist');
    }
  }

  Future<bool> isMovieInWatchlist(String movieId, String token) async {
    Uri url = Uri.parse("$baseUrl/check/$movieId");

    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['isInWatchlist'] ?? false;
    } else {
      throw Exception('Failed to check movie status in watchlist');
    }
  }

  Future<MovieListResponse?> getAllMovies(String searchedText) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.listMoviesApi,
        {'query_term': searchedText});

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieListResponse.fromJson(json);
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}