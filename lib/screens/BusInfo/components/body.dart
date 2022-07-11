import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
// import 'package:johor_wheels/models/size.dart';
import 'package:johor_wheels/constants.dart';
import 'package:johor_wheels/widget/size_card.dart';
// import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:johor_wheels/Screens/BusInfo/components/or_divider.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';
import 'package:photo_view/photo_view.dart';

class BusInfo extends StatefulWidget {
  const BusInfo({Key key}) : super(key: key);

  @override
  State<BusInfo> createState() => _BusInfo();
}

class _BusInfo extends State<BusInfo> {
  launchUrl(String url) async {
    launch(url);
  }

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bus_yellow.jpg',
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
                              const SizedBox(height: 18),
                              Text(
                                'Johor Local Bus Services',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(children: [
                                  Text(
                                    '     Johor Bahru (JB) has several bus operators running local public bus services, providing a wide public transport network coverage around JB. Most of the bus routes would start from the city center of JB, at JB Sentral and Larkin Bus Terminal.',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '     As different bus operator uses a different bus route number, several different bus route number serves the same routing as one another. In the bus network map below, bus services plying on a similar routing are denoted in the same colour. Please take note of the bus service number as indicated on the line.',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '     Launched in 2010, the Bas Iskandar Malaysia scheme has restored some of the withdrawn bus routes, mainly connecting between towns outside of the city center. By 2012, a total of 27 bus services ("IM" Bus Routes) were introduced under this scheme. However, since 2016, Bas Iskandar Malaysia bus routes were gradually withdrawn, with some being re-introduced under the new Bas Muafakat Johor scheme. As at May 2020, Bas Iskandar Malaysia bus IM05 operated by Causeway Link is still in operations.',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 10),
                              OrDivider(),
                              const SizedBox(height: 10),
                              Text(
                                'Local Bus Services Diagram',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: FullScreenWidget(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/JB_Bus_Map.png',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              OrDivider(),
                              const SizedBox(height: 20),
                              Text(
                                'Contact Information',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(children: [
                                  Text(
                                    '     Should you have any feedback for bus service operated by Causeway Link, please contact them below:',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 50),
                                ]),
                              ),
                              Text(
                                'Tel: +607-360 2244',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Fax: +607-358 4970',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Email: feedback@support.causewaylink.com.my',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Website: http://www.causewaylink.com.my',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
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
