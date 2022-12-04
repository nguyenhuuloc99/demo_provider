import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:from_flutter/utils/validate.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widget/title_input.dart';
import 'home.dart';
import 'register_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _email;
  TextEditingController? _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final auth = Provider.of<AuthProvider>(context, listen: false);

    void login()  {
      if (formKey.currentState!.validate()) {
         auth.login(_email!.text, _password!.text);
        if (auth.loginStaus == AuthState.success) {
          Navigator.pushReplacementNamed(context, Home.routeName);
        } else {
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
                  const SizedBox(
                    height: 5,
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
                    height: 5,
                  ),
                  TitleInput(
                      hintText: "Password",
                      controller: _password,
                      validator: Validator.validateForm,
                      prefixIcon: const Icon(Icons.lock)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: const Text(
                          "Đăng kí!!",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: login,
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
