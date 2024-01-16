import 'package:flutter/material.dart';
import 'package:managment/widgets/ProfileMenu.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/05.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFFAD00FF),
                          blurRadius: 0,
                          offset: Offset(0, 0),
                          spreadRadius: 6,
                        ),
                        BoxShadow(
                          color: Color(0xFFF5F5F5),
                          blurRadius: 0,
                          offset: Offset(0, 0),
                          spreadRadius: 4,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Color(0xFF90909F),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Bidur Gupta',
                            style: TextStyle(
                              color: Color(0xFF161719),
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 10, right: 10),
              width: 336,
              height: 400,
              decoration: ShapeDecoration(
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileMenu(
                      text: "Account",
                      icon: "images/wallet 3.svg",
                      press: () {}),
                  ProfileMenu(
                      text: "Setting",
                      icon: "images/settings.svg",
                      press: () {}),
                  ProfileMenu(
                      text: "Export Data",
                      icon: "images/upload.svg",
                      press: () {}),
                  ProfileMenu(
                      text: "LogOut ", icon: "images/logout.svg", press: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
