import 'package:flutter/material.dart';
// import 'package:johor_wheels/models/size.dart';
import 'package:johor_wheels/constants.dart';
// import 'package:johor_wheels/widget/size_card.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:johor_wheels/Screens/BusInfo/components/or_divider.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';

class TourGuide extends StatefulWidget {
  const TourGuide({Key key}) : super(key: key);

  @override
  State<TourGuide> createState() => _TourGuide();
}

class _TourGuide extends State<TourGuide> {
  // launchUrl(String url) async {
  //   launch(url);
  // }

  // int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/tour.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapScreen()));
                    },
                    child: Image.asset('assets/images/btn_back.png', width: 40),
                  ),
                  InkWell(
                    onTap: () {},
                    child:
                        Image.asset('assets/images/btn_share.png', width: 40),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                const SizedBox(height: 264),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tour Guide',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Divider(),
                                  Text(
                                    "Route No.",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.0,
                                  ),
                                  Text(
                                    "Route",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "5B",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 53.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Taman Universiti <--> JB Sentral"),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bus service operated by Causeway Link",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "331",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 47.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Taman Universiti <--> JB Sentral"),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bus service operated by City Bus",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "BET3",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Taman Universiti <--> JB Sentral"),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bus service operated by Causeway Link",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "A1",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 58.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("JB Sentral <--> Senai Airport"),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bus service operated by Causeway Link",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "JP01",
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "JB Sentral <--> Johor Premium Outlets"),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bus service operated by Causeway Link",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
