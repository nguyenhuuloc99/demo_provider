import 'package:flutter/material.dart';
import 'package:from_flutter/model/user.dart';
import 'package:from_flutter/provider/login_provider.dart';
import 'package:from_flutter/shared/share_prf.dart';
import 'package:provider/provider.dart';

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

    final auth = Provider.of<LoginProvider>(context, listen: false);
    Future<void> login() async {
      if (formKey.currentState!.validate()) {
        Map<String, dynamic> data =
            await auth.login(_email!.text, _password!.text);
        var user = User.fromJson(data);
        UserShared.saveUser(user.email, user.password);
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
                  TextFormField(
                    controller: _email,
                    validator: (value) {
                      return validateForm(value);
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (value) {
                      return validateForm(value);
                    },
                    autofocus: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Đăng kí!!",
                        style: TextStyle(color: Colors.blue),
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
                          minimumSize: const Size(150, 40), //////// HERE
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

  String? validateForm(String? value) {
    if (value == null || value.isEmpty) {
      return "Không để trống !!";
    }
    return null;
  }
}
