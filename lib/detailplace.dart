import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:travel/widget/detailcard.dart';

class DetailPlace extends StatelessWidget {
  final DocumentSnapshot postc;
  const DetailPlace({
    Key? key,
    required this.postc,
  }) : super(key: key);

  final String imag1 = "asset/back2.jpg";

  final String imag2 = "asset/back1.jpg";

  final String imag3 = "asset/back3.jpg";

  final String imag4 = "asset/back4.jpg";

  final String text1 = "Canada";

  final String text2 = "USA";

  final String text3 = "Pakistan";

  final String text4 = "Dubai";

  @override
  Widget build(BuildContext context) {
    int num1 = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bookmark,
                color: Colors.black,
              ))
        ],
      ),
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
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 600,
                          width: 500,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            children: [
                              Container(
                                  height: 500,
                                  // width: 30,
                                  // decoration:
                                  //     BoxDecoration(border: Border.all()),
                                  child: Swiper(
                                    loop: false,
                                    pagination: SwiperPagination(
                                        // alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.only(bottom: 115)),
                                    // control: SwiperControl(),
                                    itemCount: snapshot.data!.docs.length,
                                    layout: SwiperLayout.STACK,
                                    itemWidth: 400,
                                    viewportFraction: 1.0,
                                    fade: 1,
                                    // outer: true,
                                    scale: 0.0,
                                    itemBuilder: (context, index) {
                                      num1 = index;

                                      return DetailCard(
                                        image: snapshot.data!.docs[index]
                                            ["image"],
                                        text: snapshot.data!.docs[index]
                                            ["name"],
                                        city: snapshot.data!.docs[index]
                                            ["city"],
                                      );
                                      // return (index == 0)
                                      //     ? DetailCard(
                                      //         image: imag1,
                                      //         text: text1,
                                      //       )
                                      //     : (index == 1)
                                      //         ? DetailCard(
                                      //             image: imag2, text: text2)
                                      //         : (index == 2)
                                      //             ? DetailCard(
                                      //                 image: imag3, text: text3)
                                      //             : DetailCard(
                                      //                 image: imag4,
                                      //                 text: text4);
                                    },
                                  )),

                              // Container(
                              //   child:
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 300,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 300,
                          width: 700,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(26),
                          //     border: Border.all()),
                          child: DraggableScrollableSheet(
                            maxChildSize: 1.0,
                            minChildSize: 0.4,
                            initialChildSize: 0.4,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: Container(
                                  height: 300,
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(26),
                                  //     border: Border.all()),
                                  child: MyTabbedPage(),
                                ),
                              );
                              // MyTabbedPage();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        // shape: notec,
        // color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26), topRight: Radius.circular(26))),
          height: 100,
          width: 150,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 25),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$20",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "/ Person",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    height: 70,
                    width: 10,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(
                              5.0,
                              10.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 8.0,
                          ),
                        ],
                        color: Color(0xff1b1b1b),
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.airplane_ticket,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Book Ticket",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(height: 5, text: "Overview"),
    Tab(
      text: 'Review',
      height: 5,
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          indicatorWeight: 2.0,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          controller: _tabController,
          tabs: [
            Text(
              "Overview",
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Review",
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(controller: _tabController, children: [
          SingleChildScrollView(
            child: Text(
                "The Faisalabad Clock Tower is a clock tower in Faisalabad, Punjab, Pakistan, and is one of the oldest monuments still standing in its original state from the period of the British Raj. It was built in 1905 by the British, when they ruled much of the South Asia during the nineteenth century."),
          ),
          Text("This Place has 4.7 star rating")
        ]),
      ),
    );
  }
}
