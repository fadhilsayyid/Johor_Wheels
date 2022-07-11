import 'package:flutter/material.dart';
import 'package:johor_wheels/screens/Home/components/map_screen.dart';
import 'package:johor_wheels/screens/Settings/components/body.dart';
import 'package:provider/provider.dart';

import '../../DataHandler/appData.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites", style: TextStyle(fontSize: 20)),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MapScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2B8DAA),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Provider.of<AppData>(context).pickUpLocation != null
                        ? Provider.of<AppData>(context).pickUpLocation.placeName
                        : "Add Home"),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Your living home address",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
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
                Icon(
                  Icons.work,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add Work"),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Your office address",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
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
                Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add Favourite Address"),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Your favourite address",
                      style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
