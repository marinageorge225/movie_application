import 'dart:convert'; // ✅ تأكد من استيراد مكتبة `dart:convert`

class LoginResponse {
  LoginResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  LoginResponse.fromJson(dynamic json) {
    if (json['message'] is List) {
      message = (json['message'] as List).join(', ');
    } else {
      message = json['message']?.toString();
    }

    data = json['data']?.toString();
    statusCode = json['statusCode'];
  }

  String? message;
  String? data;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    map['statusCode'] = statusCode;
    return map;
  }

  String? get token {
    try {
      final decodedData = jsonDecode(data ?? '{}'); // ✅ تحويل `data` إلى JSON
      return decodedData['token']?.toString(); // ✅ استخراج التوكن
    } catch (e) {
      return null; // ✅ في حالة خطأ
    }
  }
}
