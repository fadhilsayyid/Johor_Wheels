import 'package:cloud_firestore/cloud_firestore.dart';

class busStop {
  String id;
  String name;
  GeoPoint coordinate;
  List busType;

  busStop.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    coordinate = data['coordinate'];
    busType = data['busType'];
  }
}
