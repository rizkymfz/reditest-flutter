import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reditest_flutter/Quiz3/Models/login_model.dart';
import 'package:reditest_flutter/Quiz3/Models/login_request_model.dart';
import 'package:reditest_flutter/Quiz3/Models/register_model.dart';
import 'package:reditest_flutter/Quiz3/Models/register_request_model.dart';
import 'package:reditest_flutter/Quiz3/services/config.dart';
import 'package:reditest_flutter/Quiz3/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeader = {
      "Content-Type": "application/json",
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode(model.toJson()),
    );

    // if (response.statusCode == 200) {
    //   await SharedService.setLoginDetails(loginResponseJson(response.body));
    //   return true;
    // } else {
    //   return false;
    // }
    return loginResponseJson(response.body);
  }

  static Future<RegisterModel> reigster(RegisterRequestModel model) async {
    Map<String, String> requestHeader = {
      "Content-Type": "application/json",
    };

    var url = Uri.http(Config.apiURL, Config.regURL);

    var response = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode(model.toJson()),
    );

    return registerModel(response.body);
  }

  static Future<String> userData() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeader = {
      "Content-Type": "application/json",
    };

    var url = Uri.http(Config.apiURL, Config.userURL);

    var response = await client.get(
      url,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
