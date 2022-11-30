// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:travel/hotel_restaurants.dart';

class Places extends StatelessWidget {
  final DocumentSnapshot post1;
  final DocumentSnapshot post2;
  final String nameP;
  final String imageP;
  final String detail;
  const Places({
    Key? key,
    required this.post1,
    required this.post2,
    required this.nameP,
    required this.imageP,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        // height: 450,
        // width: 300,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GradientText(
                        nameP,
                        colors: const [
                          Colors.blue,
                          Colors.red,
                          Colors.teal,
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(fit: BoxFit.fill, image: NetworkImage(imageP)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                // height: 200,
                // width: 700,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(detail),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelsAndRestaurants(
                          posth: post1,
                          postc: post2,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Best Nearby Restaurants and Hotels",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
