/// name : "amr mustafa"
/// email : "amr2@gmail.com"
/// password : "Amr2510@"
/// confirmPassword : "Amr2510@"
/// phone : "+201141209334"
/// avaterId : 1

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.phone, 
      this.avaterId,
    this.message,
    this.statusCode

  });

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    message = json['message'];
    statusCode=json['statusCode'];

  }

  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? avaterId;
  String? message;
  int?statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['message'] = message;
    map['statusCode'] = statusCode;
    return map;
  }

}
/*

* */