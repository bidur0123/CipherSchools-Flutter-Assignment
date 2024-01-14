import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:managment/Screens/auth/login_screen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF7B61FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 37 , left: 16),
              child: Image.asset(
                  "images/app_logo.png",
                width: 59,
                height: 59,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: h*0.55),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Welcome to  ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'ABeeZee',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.80,
                            ),
                          ),
                          Text(
                            'CipherX.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontFamily: 'Bruno Ace SC',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.72,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: ShapeDecoration(
                            color: Color(0xBFECE1E1),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "images/forward_arrow.svg",
                              width: 25,
                              height: 48,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'The best way to track your expenses.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
