import 'dart:convert';

RegisterModel registerModel(String str) =>
    RegisterModel.fromJson(jsonDecode(str));

class RegisterModel {
  RegisterModel({
    this.status,
    this.message,
    this.data,
  });
  int status;
  String message;
  Data data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
    this.name,
    this.username,
    this.password,
    this.id,
  });
  String name;
  String username;
  String password;
  int id;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['username'] = username;
    _data['password'] = password;
    _data['id'] = id;
    return _data;
  }
}
