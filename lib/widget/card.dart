// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final String imagec;
  final String textc;
  final String cityc;
  const RoundedCard({
    Key? key,
    required this.imagec,
    required this.textc,
    required this.cityc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(
                5.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            // const BoxShadow(
            //   color: Colors.white,
            //   offset: Offset(0.0, 0.0),
            //   blurRadius: 0.0,
            //   spreadRadius: 0.0,
            // ), //BoxShadow
          ],
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imagec)),
          // border: Border.all(),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
              child: Row(
                children: [
                  Text(textc,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.white,
                  ),
                  Text(
                    cityc,
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star_outlined,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.7",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
