import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum LoginSate { uninitialized, success, failure }

class LoginProvider with ChangeNotifier {
  LoginSate _loginStatus = LoginSate.uninitialized;

  LoginSate get loginStaus => _loginStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    late Map<String, dynamic> result;
    final Map<String, dynamic> data = {"email": email, "password": password};
    Response response = await http.post(Uri.parse('uri'), body: data);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      result = data;
      _loginStatus = LoginSate.success;
      notifyListeners();
    } else {}
    return result;
  }
}
