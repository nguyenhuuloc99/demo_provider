import 'dart:convert';

import 'package:flutter/material.dart';
import '../service/api.dart';
import 'package:http/http.dart';

import '../model/user.dart';
import '../shared/share_prf.dart';

enum AuthState { uninitialized,success, failure }

class AuthProvider with ChangeNotifier {
  AuthState _authStatus = AuthState.uninitialized;

  AuthState get loginStaus => _authStatus;
  Future<void> login(String email, String password) async {
    try {
      Map<String, dynamic> param = {
        "email": "loc@gmail.com",
        "password": "123456"
      };
      Response response = await
          ApiComom().methodPost(ApiComom().login, param);
      Map<String, dynamic> data = jsonDecode(response.body);
      String code = data['error'];
      if (code.compareTo("200") == 0) {
        var user = User.fromJson(data['user']);
        UserShared.saveUser(user.email, user.username);
        _authStatus = AuthState.success;
      } else {
        _authStatus = AuthState.failure;
      }
      notifyListeners();
    } catch (e) {}
  }

  Future<void> register(String username, String email, String password) async {
    try {
      Map<String, dynamic> param = {
        "username": "loc",
        "email": "ba@gmail.com",
        "password": "123456"
      };
      Response response = await
          ApiComom().methodPost(ApiComom().register, param);
      Map<String, dynamic> data = jsonDecode(response.body);
      String code = data['error'];

      if (code.compareTo("200") == 0) {
        _authStatus = AuthState.success;
      } else {
        _authStatus = AuthState.failure;
      }
      notifyListeners();
    } catch (e) {}
  }
}
