import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserShared {
  static Future saveUser(String email, String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("password", pass);
  }
}
