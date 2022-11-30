// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/cities.dart';
import 'package:travel/famous_places.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firestore = FirebaseFirestore.instance.collection("City").snapshots();
  final List<String> cityimage = [
    "https://live.staticflickr.com/4604/40427749762_85b206c870_b.jpg"
  ];
  final List<String> cityname = ["Faisalabad"];
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         fit: BoxFit.fill, image: AssetImage("asset/main.jpg"))),
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("City").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print(firestore);
              return const Center(child: CircularProgressIndicator());
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
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "asset/main.jpg",
                                ))),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 45),
                                  child: Image(
                                      height: 50,
                                      width: 45,
                                      image: AssetImage("asset/icon.png")),
                                ),
                                Spacer(),
                                Text(
                                  "Explore",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  child: Text(
                                    "Gallery",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "/Traveling",
                                      style: TextStyle(
                                        inherit: true,
                                        color: Colors.yellowAccent,
                                      ),
                                    ),
                                    Text("Explore Your Dream",
                                        style: GoogleFonts.notoSerif(
                                            fontSize: 40, color: Colors.white)),
                                    Row(
                                      children: [
                                        Text("And",
                                            style: GoogleFonts.notoSerif(
                                                fontSize: 40,
                                                color: Colors.white)),
                                        const SizedBox(width: 10),
                                        Text("Favorite",
                                            style: GoogleFonts.notoSerif(
                                                fontSize: 40,
                                                color: Colors.yellowAccent))
                                      ],
                                    ),
                                    Text("Destination",
                                        style: GoogleFonts.notoSerif(
                                            fontSize: 50, color: Colors.white))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 2000,
                        height: 1000,
                        decoration: const BoxDecoration(
                            // image: DecorationImage(image: AssetImage("assetName")),
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          // tileMode: TileMode.repeated,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.deepPurpleAccent,
                            Color.fromARGB(255, 0, 69, 126),
                          ],
                        )),
                        child: Column(
                          children: [
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Find",
                                      style: GoogleFonts.notoSerif(
                                        fontSize: 30,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text("Popular",
                                      style: GoogleFonts.notoSerif(
                                          fontSize: 30,
                                          color: Colors.yellowAccent
                                          // const Color.fromARGB(
                                          //     255, 207, 223, 67)
                                          )),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text("Destinations",
                                      style: GoogleFonts.notoSerif(
                                          fontSize: 30, color: Colors.white)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Container(
                                height: 300,
                                width: 1000,
                                // decoration: BoxDecoration(
                                //     border: Border.all(), borderRadius: BorderRadius.circular(26)),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FamousPlacs(
                                                postc:
                                                    snapshot.data!.docs[index],
                                              ),
                                            ));
                                      },
                                      child: cities(
                                        cityi: snapshot.data!.docs[index]
                                            ["image"],
                                        cityn: snapshot.data!.docs[index]
                                            ["name"],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
