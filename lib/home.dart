// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel/botomnavigationbar.dart';
import 'package:travel/detailplace.dart';
import 'package:travel/widget/bottombar.dart';
import 'package:travel/widget/card.dart';
import 'package:travel/widget/detailcard.dart';
import 'package:travel/widget/listtile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late final String title;

class _HomeState extends State<Home> {
  final firestore = FirebaseFirestore.instance.collection("City").snapshots();
  List<String> items = ["Faisalabad"];
  String? dropdownvalue = "Faisalabad";

  getData() async {
    var fire = await FirebaseFirestore.instance.collection("City").get();

    final map = fire.docs;
    for (var i = 1; i < map.length; i++) await {items.add(map[i]["name"])};
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _value = 'Faisalabad';

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Container(
          child: Scaffold(
            backgroundColor: Color(0xfff1f3f4),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 5, left: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    DropdownButton(
                      hint: Text("Select City"),
                      //under line sized box
                      underline: const SizedBox(
                        height: 0,
                      ),
                      elevation: 0,
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Icon(
                    CupertinoIcons.bell,
                    color: Colors.black,
                  ),
                )
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,

                children: [],
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("City")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print(firestore);
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return const Text("SnapShot is Empty");
                        }
                        if (snapshot.hasError) {
                          return const Text("Some Error");
                        } else {
                          return Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 16),
                                  child: Row(children: [
                                    Text(
                                      "Popular Cities",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Spacer(),
                                    // TextButton(onPressed: () {}, child: Text("See All"))
                                  ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  // margin: EdgeInsets,
                                  width: 450,
                                  height: 250,
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(),
                                  // ),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20, left: 18),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPlace(
                                                            postc: snapshot.data
                                                                .docs[index]),
                                                  ));
                                            },  
                                            child: RoundedCard(
                                              cityc: snapshot.data!.docs[index]
                                                  ["name"],
                                              imagec: snapshot.data!.docs[index]
                                                  ["image"],
                                              textc: snapshot.data!.docs[index]
                                                  ["name"],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 16,
                                        );
                                      },
                                      itemCount: snapshot.data!.docs.length),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Recomendation For you",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Spacer(),
                                      // TextButton(onPressed: () {}, child: Text("See All")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                  Container(
                    height: 350,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: SecondContainer(dropdown: dropdownvalue.toString()),
                  )
                ],
              ),
            ),

            // bottomNavigationBar: BottomAppBar(
            //   color: Colors.transparent,
            //   child: BottomNavbar(),
            // ),
          ),
        ),
      ),
    );
  }
}

class SecondContainer extends StatelessWidget {
  final String dropdown;
  const SecondContainer({
    Key? key,
    required this.dropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("famous")
            .where("location", isEqualTo: dropdown)
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 340,
                    width: 500,
                    decoration: BoxDecoration(
                        // border: Border.all(),
                        ),
                    child: ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListContainer(
                          limage: snapshot.data!.docs[index]["image"],
                          llocation: snapshot.data!.docs[index]["location"],
                          ltext: snapshot.data!.docs[index]["name"],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
