import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/account.dart';
import 'package:travel/home.dart';
import 'package:travel/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color iconColor = Colors.white;
  Color iconColor1 = Colors.white.withOpacity(0.3);
  Color iconColor2 = Colors.white.withOpacity(0.3);
  Color iconColor3 = Colors.white.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 70,
        // width: ,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(
                  10.0,
                  20.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 8.0,
              ),
            ],
            color: Color(0xff1b1b1b),
            // border: Border.all(),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: iconColor,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                  iconColor = Colors.white;
                  iconColor1 = Colors.white.withOpacity(0.3);
                  iconColor2 = Colors.white.withOpacity(0.3);
                  iconColor3 = Colors.white.withOpacity(0.3);
                });
              },
              icon: Icon(size: 32, Icons.home),
            ),
            IconButton(
              color: iconColor1,
              onPressed: () {
                setState(() {
                  iconColor1 = Colors.white;
                  iconColor = Colors.white.withOpacity(0.3);
                  Color iconColor2 = Colors.white.withOpacity(0.3);
                  Color iconColor3 = Colors.white.withOpacity(0.3);
                });
              },
              icon: Icon(size: 32, Icons.search),
            ),
            IconButton(
              color: iconColor2,
              onPressed: () {
                setState(() {
                  iconColor2 = Colors.white;
                  iconColor = Colors.white.withOpacity(0.3);
                  Color iconColor1 = Colors.white.withOpacity(0.3);

                  Color iconColor3 = Colors.white.withOpacity(0.3);
                });
              },
              icon: Icon(size: 32, Icons.airplane_ticket),
            ),
            IconButton(
              color: iconColor3,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountScreen(),
                      ));
                  iconColor3 = Colors.white;
                  iconColor = Colors.white.withOpacity(0.3);
                  Color iconColor1 = Colors.white.withOpacity(0.3);
                  Color iconColor2 = Colors.white.withOpacity(0.3);
                });
              },
              icon: Icon(size: 32, Icons.account_box),
            ),
          ],
        ),
      ),
    );
  }
}
