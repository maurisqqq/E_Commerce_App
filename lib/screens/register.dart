import 'package:firstapps/component/color_constant.dart';
import 'package:firstapps/component/text_component.dart';
import 'package:firstapps/service/apiservice.dart';
import 'package:firstapps/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ApiService _apiService = ApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController asalnegaraController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/register.svg",
                      height: 200,
                    ),
                    textForm(
                        controller: emailController,
                        label: "Email",
                        obs: false),
                    SizedBox(height: 20),
                    textForm(
                        controller: passwordController,
                        label: "Password",
                        obs: true),
                    SizedBox(
                      height: 20,
                    ),
                    textForm(
                        controller: namaController, label: "Name", obs: false),
                    SizedBox(
                      height: 20,
                    ),
                    textForm(
                        controller: asalnegaraController,
                        label: "Country",
                        obs: false),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState()!.validate()) {
                                _apiService
                                    .postRegister(emailController.text,
                                        passwordController.text)
                                    .then((value) => {
                                          if (value != null)
                                            {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Login())),
                                              print("Berhasil Registrasi")
                                            }
                                        });
                              }
                            },
                            child: Text("Sign Up"))),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: mBorderColor, width: 2)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 90, right: 90),
                        child: Container(
                          child: Text.rich(
                              TextSpan(text: 'Have an Account?', children: [
                            TextSpan(
                                text: ' Sign In',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                style: TextStyle(color: Colors.blue[300]))
                          ])),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
