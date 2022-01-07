import 'package:firstapps/component/color_constant.dart';
import 'package:firstapps/component/text_component.dart';
import 'package:firstapps/screens/register.dart';
import 'package:firstapps/screens/home_screen.dart';
import 'package:firstapps/service/apiservice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                SvgPicture.asset(
                  "assets/svg/logo.svg",
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                ),
                SizedBox(height: 20),
                textForm(
                  controller: emailController,
                  obs: false,
                  label: "Email",
                ),
                SizedBox(height: 30),
                textForm(
                  controller: passwordController,
                  obs: true,
                  label: "Password",
                ),
                SizedBox(height: 30),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState()!.validate()) {
                            _apiService
                                .postLogin(emailController.text,
                                    passwordController.text)
                                .then((value) => {
                                      if (value != null)
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen())),
                                          print("Masuk ke Homepage")
                                        }
                                    });
                          }
                        },
                        child: Text("Login"))),
                SizedBox(height: 250),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: mBorderColor, width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 80, right: 80),
                    child: Container(
                      child: Text.rich(
                          TextSpan(text: "Don't Have Account?", children: [
                        TextSpan(
                          text: ' Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                            },
                          style: TextStyle(
                            color: Colors.blue[300],
                          ),
                        )
                      ])),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
