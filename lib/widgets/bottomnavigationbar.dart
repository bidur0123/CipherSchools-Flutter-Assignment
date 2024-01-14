import 'package:flutter/material.dart';
import 'package:managment/Screens/Add_Screen/add.dart';
import 'package:managment/Screens/Home_Screen/home.dart';
import 'package:managment/Screens/Profile_Screen/profile.dart';
import 'package:managment/Screens/Statistics/statistics.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [Home(), Statistics(), Home(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Screen()));
        },
        child: Icon(
            Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Color(0xff7F3DFF),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Color(0xff7F3DFF) : Color(0xffC6C6C6),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1 ? Color(0xff7F3DFF) : Color(0xffC6C6C6),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.pie_chart,
                  size: 30,
                  color: index_color == 2 ? Color(0xff7F3DFF) : Color(0xffC6C6C6),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.person_sharp,
                  size: 30,
                  color: index_color == 3 ? Color(0xff7F3DFF) : Color(0xffC6C6C6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
