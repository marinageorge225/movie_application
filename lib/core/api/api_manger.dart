import 'dart:convert';
import 'package:graduation_movie_app/model/movie_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../model/get_profile_response.dart';
import '../../model/LoginResponse.dart';
import '../../model/user_model_register.dart';
import 'end_points.dart';
import 'package:graduation_movie_app/core/api/api_constants.dart';

@singleton
class ApiManager {
  static Future<UserModel> registerUser(UserModel user) async {
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


  Future<MovieListResponse?> getMovieListByGenre(String genre) async {
    Uri url = Uri.https(ApiConstants.movieListBaseServer, EndPoints.listMoviesApi,
    {'genre' : genre});
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

  static Future<MovieListResponse?> getMovies() async {
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
  static Future<GetProfileResponse?> getProfileInfo(String token)async{
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


  static Future<GetProfileResponse?> updateProfileInfo({required String token,
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

  static Future<GetProfileResponse?> deleteProfileInfo(String token)async{
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

}