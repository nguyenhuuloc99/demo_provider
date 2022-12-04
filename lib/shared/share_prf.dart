import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserShared {
  static Future saveUser(String email, String username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("username", username);
    sharedPreferences.commit();
  }

  static Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String email = sharedPreferences.getString("email")!;
    String username = sharedPreferences.getString("username")!;
    return User(email: email, username: username);
  }
}
