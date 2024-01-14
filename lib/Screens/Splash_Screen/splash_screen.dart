import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF7B61FF),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: h*0.4),
              child: Center(
                  child: Image.asset("images/app_logo.png"))),
          Text(
            'CipherX',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontFamily: 'Bruno Ace SC',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.72,
            ),
          )
        ],
      ),
    );
  }
}
