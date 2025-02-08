/// message : "Profile fetched successfully"
/// data : {"_id":"67a55f72e31c5028c2f0733a","email":"rowansherif182@gmail.com","password":"$2b$10$1AWqTCPOHpblxK3oHYUaguHQuR57Ivk7KA28RWtatXPYfakJYwARK","name":"rowan","phone":"+201275794886","avaterId":2,"createdAt":"2025-02-07T01:18:42.615Z","updatedAt":"2025-02-07T01:18:42.615Z","__v":0}

class GetProfileResponse {
  GetProfileResponse({
      this.message,
    this.error,
    this.statusCode,
      this.data,});

  GetProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;
  String? error;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// _id : "67a55f72e31c5028c2f0733a"
/// email : "rowansherif182@gmail.com"
/// password : "$2b$10$1AWqTCPOHpblxK3oHYUaguHQuR57Ivk7KA28RWtatXPYfakJYwARK"
/// name : "rowan"
/// phone : "+201275794886"
/// avaterId : 2
/// createdAt : "2025-02-07T01:18:42.615Z"
/// updatedAt : "2025-02-07T01:18:42.615Z"
/// __v : 0

class Data {
  Data({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}