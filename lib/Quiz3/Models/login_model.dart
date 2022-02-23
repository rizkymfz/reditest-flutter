import 'dart:convert';

LoginModel loginResponseJson(String str) =>
    LoginModel.fromJson(jsonDecode(str));

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });
  int status;
  String message;
  Data data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.username,
    this.password,
    this.createdAt,
  });
  int id;
  String name;
  String username;
  String password;
  String createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    username = json['username'] ?? "";
    password = json['password'] ?? "";
    createdAt = json['created_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['password'] = password;
    _data['created_at'] = createdAt;
    return _data;
  }
}
