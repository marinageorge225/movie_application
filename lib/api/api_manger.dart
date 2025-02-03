import 'dart:convert';
import 'package:graduation_movie_app/api/api_constant.dart';
import 'package:http/http.dart' as http;
import '../model/LoginResponse.dart';

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
}
