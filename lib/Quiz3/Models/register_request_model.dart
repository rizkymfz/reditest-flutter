class RegisterRequestModel {
  RegisterRequestModel({
    this.name,
    this.username,
    this.password,
  });
  String name;
  String username;
  String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }
}
