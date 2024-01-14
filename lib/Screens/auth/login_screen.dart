import 'dart:io';

import 'package:flutter/material.dart';
import 'package:managment/Screens/auth/password_reset.dart';
import 'package:managment/Screens/auth/signup_screen.dart';
import 'package:managment/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final AuthController _authController = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
            Center(
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.indigo, width: 2.0),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                // labelStyle: TextStyle(
                //     fontFamily: GoogleFonts.poppins().fontFamily
                // ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.indigo, width: 2.0),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                suffixIcon: Icon(
                  Icons.lock_outlined,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: this.value,
                      onChanged: _toggleCheckBox,
                      activeColor: Colors.indigo,
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PasswordReset())),
                  child: Container(
                      alignment: Alignment.topRight,
                     // margin: EdgeInsets.only(left: 120),
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: Colors.grey[400],
              )),
              Text(
                "or",
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(
                  child: Divider(
                color: Colors.grey[400],
              )),
            ]),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  await signInWithGoogle();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Container(
                  height: 40,
                  width: 210,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/google.png',
                          width: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black),
                        ),
                      ]),
                )),
            SizedBox(
              height: 65,
            ),
            GestureDetector(
              onTap: () async => await loginUsers(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen())),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    ));
  }

  bool activeConnection = false;
  String T = "";

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          // T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  loginUsers() async {
    setState(() {
      _isLoading = true;
    });
    String res = await _authController.loginUsers(
        emailController.text, passwordController.text);
    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr(
          'Congratulations you have been successfully signed in..', context);
      return Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  void _toggleCheckBox(bool? check) {
    setState(() {
      value = check!;
    });
  }

  signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    String res = await _authController.signinWithGoogle();
    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr(
          'Congratulations you have been successfully signed in..', context);
      return Navigator.of(context).pushReplacementNamed('/home');
    }
  }
}
