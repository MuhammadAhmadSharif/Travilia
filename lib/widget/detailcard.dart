// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCard extends StatelessWidget {
  final String image;
  final String city;
  final String text;

  const DetailCard({
    Key? key,
    required this.image,
    required this.city,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            height: 700,
            decoration: BoxDecoration(
                // border: Border.all(),
                ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 450,
                  // width: 4,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(
                            5.0,
                            10.0,
                          ),
                          blurRadius: 10.0,
                          // spreadRadius: 5.0,
                        ), //BoxShadow
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            image,
                          )),
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 18, right: 18),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: FittedBox(
                                    child: Text(
                                      text,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.star_outlined,
                                    color: Colors.orange,
                                    size: 28,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "4.7",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    // style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
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
                              SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  city,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "(3335 reviews)",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //add
                ),
              ],
            ),
          ),
        ));
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
          Text("data")
        ]),
      ),
    );
  }
}
