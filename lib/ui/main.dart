import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:from_flutter/provider/auth_provider.dart';
import 'package:from_flutter/ui/home.dart';
import 'package:from_flutter/ui/register_screen.dart';
import 'package:provider/provider.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        builder: EasyLoading.init(),
        routes: {
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          Home.routeName: (context) => Home()
        },
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}
