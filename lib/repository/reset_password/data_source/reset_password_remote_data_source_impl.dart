import 'package:graduation_movie_app/model/LoginResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_manger.dart';
import '../../../core/api/end_points.dart';
import '../../../model/reset_password_response.dart';
import 'reset_password_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiManager apiManager;

  ResetPasswordRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<ResetPasswordResponse> resetPassword({
    required String token,
    required String newPassword,
    required String oldPassword,
  }) async {
    Uri url =
    Uri.https(ApiConstants.profileBaseUrl, EndPoints.resetPasswordApi);

    try {
      var response = await http.patch(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": ApiConstants.contentType,
        },
        body: jsonEncode({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        }),
      );

      var resetResponse = ResetPasswordResponse.fromJson(jsonDecode(response.body));
        return resetResponse;

    } catch (e) {
      print("Exception: ${e.toString()}");
      return ResetPasswordResponse(
        message: "An error occurred",
        statusCode: 400,
      );
    }

  }
}
