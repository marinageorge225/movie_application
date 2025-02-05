import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model_register.dart';
import 'api_constants.dart';

class ApiService {
  Future<UserModel> registerUser(UserModel user) async {
    final url = Uri.parse(ApiConstants.baseUrlRegister);
    final jsonData = jsonEncode(user.toJson());

    print("  Sending data to API: $jsonData");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
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
}
/*
الاسم: John Doe
الإيميل: johndoe65@gmail.com
كلمة المرور: StrongPass@123
تأكيد كلمة المرور: StrongPass@123
رقم الهاتف: +2011122233

* */