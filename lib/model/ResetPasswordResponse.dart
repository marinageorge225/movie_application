/// message : "Old password does not match"

class ResetPasswordResponse {
  ResetPasswordResponse({
      this.message,this.statusCode

  });

  ResetPasswordResponse.fromJson(dynamic json) {
    if (json['message'] is List) {
      message = (json['message'] as List).join(',');
    } else {
      message = json['message']?.toString();
    }    statusCode = json['statusCode'];

  }
  String? message;
  int? statusCode;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;


    return map;
  }

}