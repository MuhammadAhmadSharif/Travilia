// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cities extends StatelessWidget {
  final String cityi;
  final String cityn;
  const cities({
    Key? key,
    required this.cityi,
    required this.cityn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 230,
        // decoration: BoxDecoration(
        //     border: Border.all(),
        //     borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Container(
              height: 220,
              width: 250,
              // decoration: BoxDecoration(
              //     border: Border.all(),
              //     borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                child: Image(fit: BoxFit.fitHeight, image: NetworkImage(cityi)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              cityn,
              style: GoogleFonts.alata(
                color: Colors.white,
                fontSize: 20,
              ),
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 18,
              // ),
            )

            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: 10,
            //   width: 100,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(30)),
            // )
          ],
        ),
      ),
    );
  }
}
