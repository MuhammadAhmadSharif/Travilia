// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:travel/widget/hotels.dart';

import 'home_screen.dart';



class HotelsAndRestaurants extends StatelessWidget {
  final DocumentSnapshot posth;
  final DocumentSnapshot postc;
  const HotelsAndRestaurants({
    Key? key,
    required this.posth,
    required this.postc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final firestore = FirebaseFirestore.instance
    //     .collection("City")
    //     .doc(posth.id)
    //     .collection("famousPlaces")
    //     .doc(postc.id)
    //     .collection("restaurants")
    //     .snapshots;

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("City")
              .doc(posth.id)
              .collection("famousPlaces")
              .doc(postc.id)
              .collection("restaurants")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // print(postc.id);
            print(posth.id);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Text("SnapShot is Empty");
            }
            if (snapshot.hasError) {
              return const Text("Some Error");
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientText(
                          "AHMAD GREWAL",
                          style: GoogleFonts.indieFlower(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: [
                            Colors.black,
                            Colors.red,
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ));
                                },
                                child: Text(
                                  "Home",
                                  style: TextStyle(fontSize: 25),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More Places",
                                  style: TextStyle(fontSize: 25),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ));
                                },
                                child: Text(
                                  "Contact",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ],
                        ),
                        GradientText(
                          "Book Now",
                          style: GoogleFonts.indieFlower(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: [
                            Colors.blue,
                            Colors.red,
                            Colors.teal,
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(),
                        //     borderRadius: BorderRadius.circular(26)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                // decoration: BoxDecoration(border: Border.all()),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 25),
                                      child: Text(
                                        postc["name"].toString(),
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(50.0),
                                      child: Text(
                                        postc["detail"].toString(),
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                // decoration: BoxDecoration(border: Border.all()),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CircleAvatar(
                                    radius: 250,
                                    backgroundImage:
                                        NetworkImage(postc["image"]),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("Best nearby Restaurants and Hotels",
                        style: GoogleFonts.bebasNeue(fontSize: 50)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 110, vertical: 32),
                      child: Container(
                        child: ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Hotels(
                                image: snapshot.data!.docs[index]["image"],
                                loc: snapshot.data!.docs[index]["location"],
                                name: snapshot.data!.docs[index]["name"],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                                      width: 15,
                                    )),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
