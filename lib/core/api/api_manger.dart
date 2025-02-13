import 'dart:convert';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../../model/GetProfileResponse.dart';
import '../../model/LoginResponse.dart';
import '../error/failures.dart';
import 'api_constant.dart';
import 'end_points.dart';

@singleton
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


  Future<MovieListResponse?> getMovieListByGenre(String genre) async {
    Uri url = Uri.https(ApiConstant.movieListBaseServer, EndPoints.listMoviesApi,
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
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.movieApi, {
      'sort_by': 'year',
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
    Uri url = Uri.https(ApiConstant.profileBaseUrl, EndPoints.profileApi);
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

  static Future<GetProfileResponse?> deleteProfileInfo(String token)async{
    Uri url = Uri.https(ApiConstant.profileBaseUrl, EndPoints.profileApi);
    try {
      var response = await http.delete(url,
          headers: {'Authorization' : token,
            "Content-Type": ApiConstant.contentType,});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return GetProfileResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  static Future<GetProfileResponse?> updateProfileInfo({
    required String token,
    String? name,
    String? phone,
    int? avatarId,
  }) async {
    Uri url = Uri.https(ApiConstant.profileBaseUrl, EndPoints.profileApi);

    try {
      Map<String, dynamic> bodyData = {};
      if (name != null) bodyData["name"] = name;
      if (phone != null) bodyData["phone"] = phone;
      if (avatarId != null) bodyData["avaterId"] = avatarId;

      var response = await http.patch(
        url,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),

      );

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        print(response.statusCode);
        return GetProfileResponse.fromJson(json);
      }
      else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }




}