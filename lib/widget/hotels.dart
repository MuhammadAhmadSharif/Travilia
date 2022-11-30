// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Hotels extends StatelessWidget {
  final String loc;
  final String name;
  final String image;
  Hotels({
    Key? key,
    required this.loc,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      width: 300,
      // decoration: BoxDecoration(
      //   border: Border.all(),
      //   borderRadius: BorderRadius.circular(26),
      // ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              height: 250,
              width: 300,

              // height: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(26)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      color: Color(0xffE0D9D9),
                      // width: 300,
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      //   borderRadius: BorderRadius.circular(26),
                      // ),
                      child: FittedBox(
                        child: DefaultTextStyle(
                          style: TextStyle(
                              fontSize: 25,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                          child: Text(name),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      // height: 200,
                      // width: 700,
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      //   borderRadius: BorderRadius.circular(25),
                      // ),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                        child: ListTile(
                          subtitle: Text(
                            loc,
                            style: TextStyle(fontSize: 18),
                          ),
                          title: Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          trailing: Icon(
                            Icons.location_city,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(fit: BoxFit.fill, image: NetworkImage(image)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
