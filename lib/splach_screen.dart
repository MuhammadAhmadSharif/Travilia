import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:travel/botomnavigationbar.dart';
import 'package:travel/home.dart';
import 'package:travel/home_screen.dart';
import 'package:travel/onbording.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}
class _SplachScreenState extends State<SplachScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbar(),));
    } else {
      await prefs.setBool('seen', true);
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnBordingScreen(),));
    }
  }

  @override
  void initState() {
    var initState = super.initState();
    // startTimer();
    //  checkFirstSeen();
    Timer(
        const Duration(seconds: 3),
        () => checkFirstSeen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              WelcomeImage(),
            ],
          ),
        ),
      ),
    );
  }
//   void startTimer() {
//   Timer(Duration(seconds: 3), () {
//     navigateUser(); //It will redirect  after 3 seconds
//   });
// }

// void navigateUser() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var status = prefs.getBool('isLoggedIn');
//   print(status);
//   if (status == true) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Home(),
//         ));
//   } else {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => OnBordingScreen(),
//         ));
//   }
// }
}



class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "asset/icon.png",
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
              child: GradientText(
            "Travilia",
            style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            colors: const [
              Colors.brown,
              Colors.green,
              Colors.black,
            ],
          ))
        ],
      ),
    );
  }
}
