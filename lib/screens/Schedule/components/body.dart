import 'package:flutter/material.dart';
// import 'package:johor_wheels/models/size.dart';
import 'package:johor_wheels/constants.dart';
// import 'package:johor_wheels/widget/size_card.dart';
// import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:johor_wheels/Screens/BusInfo/components/or_divider.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';

class ScheduleFare extends StatefulWidget {
  const ScheduleFare({Key key}) : super(key: key);

  @override
  State<ScheduleFare> createState() => _ScheduleFare();
}

class _ScheduleFare extends State<ScheduleFare> {
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
              'assets/images/bus_yellow2.jpg',
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
                              const SizedBox(height: 15),
                              Text(
                                'Operating Hours and Frequencies',
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
                                    '     Most bus routes in Johor Bahru operate from morning to night, from 5-6am to 10pm. ‘Leisure’ bus services, such as those serving between JB Sentral / CIQ Second Link and popular tourist haunts (such as Legoland, Puteri Harbour and various shopping destinations) usually start later.',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '     Although exact frequencies are difficult to acquire (unless you ask bus drivers or bus terminal staff), most bus routes operate at frequencies between 15 and 45 minutes, while some routes operate at longer headway of up to 2 hours or more. The prevalence of private transport in Johor Bahru mean that buses serving low-density townships are likely to have very low frequencies.',
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
                                'Fare Payment',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Text(
                                      '     Most bus routes in Johor Bahru charge fares based on the section fare scheme, and every bus route operates on a separate fare structure. For example, consider a bus route passing through District A to E in alphabetical order. Boarding from District A, passengers would pay be charged different fares upon boarding, depending whether they are intending to alight at District B, C, D or E.',
                                      style: poppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      '     All buses in JB accept cash fare payment, and most of them will offer small change unless otherwise stated. For starters, tell the bus driver where you intend to alight, and he will advise you on the correct fare, and a printed receipt will be issued upon payment. Keep this receipt with you until you alight, should you need to product it for fare checks.',
                                      style: poppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 15),
                                    Image.asset(
                                      'assets/images/bus_fare.png',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      'Section Fare of route BET1',
                                      style: poppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              OrDivider(),
                              const SizedBox(height: 10),
                              Text(
                                'JB Tourist Bus Pass',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '     Causeway Link offers the JB Tourist Bus Pass, valid for unlimited Causeway Link bus rides (except for Bus Muafakat Johor services) over 2 or 3 days, for RM55 or RM80.',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.justify,
                              ),
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
