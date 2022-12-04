import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:from_flutter/utils/validate.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widget/title_input.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_screen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final auth = Provider.of<AuthProvider>(context);
    TextEditingController? _email = TextEditingController();
    TextEditingController? _password = TextEditingController();
    TextEditingController? _username = TextEditingController();
    void register() {
      if (formKey.currentState!.validate()) {
        auth.register(_username.text, _email.text, _password.text);
        if (auth.loginStaus == AuthState.success) {
          EasyLoading.dismiss();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Khong thanh cong")));
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleInput(
                    hintText: "User name",
                    controller: _username,
                    validator: Validator.validateForm,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TitleInput(
                    hintText: "Email",
                    controller: _email,
                    validator: Validator.validateForm,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TitleInput(
                      hintText: "Password",
                      controller: _password,
                      validator: Validator.validateForm,
                      prefixIcon: const Icon(Icons.lock)),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
