// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/account.dart';
import 'package:travel/detailplace.dart';
import 'package:travel/home.dart';
import 'package:travel/search.dart';
import 'package:travel/ticket.dart';
import 'package:travel/widget/bottombar.dart';

class BottomNavbar extends StatefulWidget {

  BottomNavbar({
    Key? key,

  }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Color iconColor = Colors.white;
  Color iconColor1 = Colors.white.withOpacity(0.3);
  Color iconColor2 = Colors.white.withOpacity(0.3);
  Color iconColor3 = Colors.white.withOpacity(0.3);
  int myIndex = 0;
  List<Widget> screens = [
    Home(),
    DetailScreen(),
    TicketScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.transparent,
          body: screens[myIndex],
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                // color: Colors.transparent,
                height: 70,
                // width: ,
                decoration: BoxDecoration(
                    color: Color(0xff1b1b1b),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      color: iconColor,
                      onPressed: () {
                        setState(() {
                          myIndex = 0;
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
                          myIndex = 1;
                          iconColor1 = Colors.white;
                          iconColor = Colors.white.withOpacity(0.3);
                          iconColor2 = Colors.white.withOpacity(0.3);
                          iconColor3 = Colors.white.withOpacity(0.3);
                        });
                      },
                      icon: Icon(size: 32, Icons.search),
                    ),
                    IconButton(
                      color: iconColor2,
                      onPressed: () {
                        setState(() {
                          myIndex = 2;
                          iconColor2 = Colors.white;
                          iconColor = Colors.white.withOpacity(0.3);
                          iconColor1 = Colors.white.withOpacity(0.3);

                          iconColor3 = Colors.white.withOpacity(0.3);
                        });
                      },
                      icon: Icon(size: 32, Icons.airplane_ticket),
                    ),
                    IconButton(
                      color: iconColor3,
                      onPressed: () {
                        setState(() {
                          myIndex = 3;
                          iconColor3 = Colors.white;
                          iconColor = Colors.white.withOpacity(0.3);
                          iconColor1 = Colors.white.withOpacity(0.3);
                          iconColor2 = Colors.white.withOpacity(0.3);
                        });
                      },
                      icon: Icon(size: 32, Icons.account_box),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
