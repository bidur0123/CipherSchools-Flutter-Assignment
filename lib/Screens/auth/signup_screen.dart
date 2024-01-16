import 'dart:io';

import 'package:flutter/material.dart';
import 'package:managment/Screens/auth/login_screen.dart';
import 'package:managment/Screens/auth/verification_screen.dart';
import 'package:managment/controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool? value = false;
  bool _isLoading = false;
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

  @override
  void initState() {
    checkUserConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25 , top: 120),
          child: Column(children: [
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                // labelStyle:
                //     TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.indigo, width: 2.0),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                suffixIcon: const Icon(
                  Icons.account_circle,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.indigo, width: 2.0),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                suffixIcon: const Icon(
                  Icons.lock_outlined,
                  size: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () => signUpUser(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an account",
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen())),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 25,
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
              height: 15,
            ),
            ElevatedButton(
                onPressed: ()  async {
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
          ]),
        ),
      ),
    ));
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpUser(
      emailController.text.trim(),
      passwordController.text.trim(),
      nameController.text,
    );

    if (res != 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      return showSnackBarr(res, context);
    } else {
      if (!mounted) return;
      showSnackBarr(
          'Congratulations account has been created for you', context);
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Verify()));
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
      return Navigator.of(context).pushReplacementNamed('/bottom');
    }
  }
}
