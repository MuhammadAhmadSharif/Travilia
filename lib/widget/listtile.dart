// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  final String ltext;
  final String limage;
  final String llocation;
  const ListContainer({
    Key? key,
    required this.ltext,
    required this.limage,
    required this.llocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(limage),
                    fit: BoxFit.fill,
                  ),
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                  // width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: FittedBox(
                    child: Text(
                      ltext,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FittedBox(child: Text(llocation))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("4.7 (1203 reviews)"),
                    // Spacer(),
                    // Text("data")
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 90,
            ),
            child: Container(
              width: 75,
              // decoration: BoxDecoration(border: Border.all()),
              child: FittedBox(
                child: EasyRichText(
                  "\$22/Person",
                  textAlign: TextAlign.left,
                  patternList: [
                    EasyRichTextPattern(
                        targetString: "22",
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 24))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
