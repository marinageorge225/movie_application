import 'dart:convert';
import 'package:graduation_movie_app/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_movie_app/model/user_model_register.dart';

class ApiService {
  Future<UserModel> registerUser(Map<String, dynamic> userData) async {
    try {
      var response = await http.post(
        Uri.parse(ApiConstants.baseUrlRegister),
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return UserModel.fromJson(jsonResponse);
      } else {
        throw handleErrorResponse(response);
      }
    } catch (e) {
      throw e;
    }
  }

}

  String handleErrorResponse(http.Response response) {
    var responseBody = jsonDecode(response.body);

    if (responseBody is Map && responseBody.containsKey("message")) {
      return responseBody["message"];
    }

    if (response.statusCode == 400) {
      return "Invalid request, please check your inputs.";
    } else if (response.statusCode == 401) {
      return "Unauthorized request, please check your credentials.";
    } else if (response.statusCode == 403) {
      return "You do not have permission to perform this action.";
    } else if (response.statusCode == 404) {
      return "The requested resource was not found.";
    } else if (response.statusCode == 409) {
      return "Email already exists, please try another email.";
    } else if (response.statusCode == 500) {
      return "Server error, please try again later.";
    } else {
      return "Unexpected error occurred. Please try again.";
    }
  }


