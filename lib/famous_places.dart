// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:travel/widget/places.dart';

class FamousPlacs extends StatelessWidget {
 final DocumentSnapshot postc;
  FamousPlacs({
    Key? key,
    required this.postc,
  }) : super(key: key);



  // final firestore = FirebaseFirestore.instance
  //     .collection("City")
  //     .doc(postc.id.toString())
  //     .collection("famousPlaces")
  //     .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("City")
              .doc(postc.id)
              .collection("famousPlaces")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Text("SnapShot is Empty");
            }
            if (snapshot.hasError) {
              return const Text("Some Error");
            } else {
              return SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: AssetImage("asset/back.jpg")),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all()),
                  // height: 800,
                  width: 6000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(26),
                        //     border: Border.all()),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: GradientText(
                                  "  Famaous Places of ${postc["name"].toString()}  ",
                                  style: const TextStyle(
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold),
                                  colors: const [
                                    Colors.blue,
                                    Colors.red,
                                    Colors.teal,
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          // height: 500,
                          width: 900,
                          // decoration: BoxDecoration(border: Border.all()),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Places(
                                    imageP: snapshot.data!.docs[index]["image"],
                                    nameP: snapshot.data!.docs[index]["name"],
                                    detail: snapshot.data!.docs[index]
                                        ["detail"],
                                    post1: postc,
                                    post2: snapshot.data!.docs[index],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
