// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel/botomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'botomnavigationbar.dart';
import 'package:travel/home.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  void isviewed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
  }

  int num1 = 0;
  @override
  Widget build(BuildContext context) {
    final String text1 = "Canada";
    final String text2 = "USA";
    final String text3 = "Pakistan";
    final String text4 = "Dubai";
    final String imag1 = "asset/back2.jpg";
    final String imag2 = "asset/back1.jpg";
    final String imag3 = "asset/back3.jpg";
    final String imag4 = "asset/back4.jpg";

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                num1 = index;
                return (index == 0)
                    ? Backimage(
                        image5: imag1,
                        text5: text1,
                        num: index,
                      )
                    : (index == 1)
                        ? Backimage(
                            image5: imag2,
                            text5: text2,
                            num: index,
                          )
                        : (index == 2)
                            ? Backimage(
                                image5: imag3,
                                text5: text3,
                                num: index,
                              )
                            : Backimage(
                                image5: imag4,
                                text5: text4,
                                num: index,
                              );
              },
              onIndexChanged: (value) {
                num1 = value;
              },
              loop: false,
              pagination: SwiperPagination(
                  // alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 200)),
              // control: SwiperControl(),
              itemCount: 4,
              viewportFraction: 1.0,
              scale: 0.0,
            ),
          ),
          Positioned(
            top: 660,
            child: Container(
              height: 300,
              width: 425,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        isviewed();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavbar(),
                            ));
                      },
                      child: RoundedButton()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("already have an account?"),
                      TextButton(onPressed: () {}, child: const Text("Login"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Backimage extends StatefulWidget {
  final String image5;
  final int num;
  final String text5;

  Backimage({
    Key? key,
    required this.image5,
    required this.num,
    required this.text5,
  }) : super(key: key);

  @override
  State<Backimage> createState() => _BackimageState();
}

class _BackimageState extends State<Backimage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 490,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    widget.image5,
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 24),
                child: Text(
                  "Explore\n${widget.text5} \nwith us",
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(
                  "We Travellin are ready to help you on \nvacation around ${widget.text5}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
              // Text(
              //   "Canada",
              //   style: TextStyle(fontSize: 64, color: Colors.white),
              // ),
              // Text(
              //   "with us",
              //   style: TextStyle(fontSize: 64, color: Colors.white),
              // ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 15,
          child: Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        )
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
//final String name;
// final String image;
  const RoundedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 64,
        right: 64,
      ),
      child: Container(
        height: 70,
        // width: 10,
        decoration: BoxDecoration(
            color: Color(0xff1b1b1b),
            border: Border.all(),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "Let's Get Started ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
