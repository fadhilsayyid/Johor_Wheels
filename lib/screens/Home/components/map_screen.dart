import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:johor_wheels/auth_services.dart';
// import 'package:johor_wheels/screens/Home/components/directions_model.dart';
// import 'package:johor_wheels/screens/Home/components/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:johor_wheels/screens/TourGuide/tourGuide_screen.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';
import 'package:johor_wheels/screens/BusInfo/busInfo_screen.dart';
import 'package:johor_wheels/screens/Favourite/favourite_screen.dart';
import 'package:johor_wheels/screens/Settings/settings_screen.dart';
import 'package:johor_wheels/screens/Schedule/scheduleFare_screen.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../../DataHandler/appData.dart';
import '../../../assistants/assistantMethods.dart';
import '../../Home/components/divider.dart';
import '../../searchScreen/search_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  Set<Marker> _markers = {};

  GoogleMapController _googleMapController;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  BitmapDescriptor mapMarker;

  Position currentPosition;
  double bottomPaddingOfMap = 0;
  var geolocator = Geolocator();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};

  // Marker _origin;
  // Marker _destination;
  // Directions _info;

  void locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address =
        await AssistantMethods.searchCoordinateAddress(position, context);
    print("This is your Address : " + address);
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(1.4634702594246947, 103.76438603755997),
    zoom: 15,
  );

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/icons/bus-stop.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    _controllerGoogleMap.complete(controller);
    _googleMapController = controller;

    locatePosition();

    setState(() {
      bottomPaddingOfMap = 300.0;
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          icon: mapMarker,
          infoWindow: InfoWindow(
              title: 'JB Sentral Bus Terminal', snippet: 'Bus Terminal'),
          position: LatLng(1.4634702594246947, 103.76438603755997)));

      _markers.add(Marker(
          markerId: MarkerId('id-2'),
          icon: mapMarker,
          infoWindow:
              InfoWindow(title: 'Larkin Terminal', snippet: 'Bus Terminal'),
          position: LatLng(1.4959920402435456, 103.74387029091355)));

      _markers.add(Marker(
          markerId: MarkerId('id-3'),
          icon: mapMarker,
          infoWindow: InfoWindow(
              title: 'Taman Universiti Terminal', snippet: 'Bus Terminal'),
          position: LatLng(1.5381946246202942, 103.62840156419995)));

      _markers.add(Marker(
          markerId: MarkerId('id-4'),
          icon: mapMarker,
          infoWindow: InfoWindow(
              title: 'Majlis Bandaraya Johor Bahru', snippet: 'Bus Stop'),
          position: LatLng(1.4555419743280553, 103.76175190675427)));

      _markers.add(Marker(
          markerId: MarkerId('id-5'),
          icon: mapMarker,
          infoWindow: InfoWindow(
              title: 'Hospital Sultanah Aminah', snippet: 'Bus Stop'),
          position: LatLng(1.457501970112334, 103.7466836767007)));

      _markers.add(Marker(
          markerId: MarkerId('id-6'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Plaza Angsana', snippet: 'Bus Stop'),
          position: LatLng(1.4969648852762782, 103.7017839280807)));

      _markers.add(Marker(
          markerId: MarkerId('id-7'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'KIP Mart Tampoi', snippet: 'Bus Stop'),
          position: LatLng(1.5081406593600981, 103.68916327193283)));

      _markers.add(Marker(
          markerId: MarkerId('id-8'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Paradigm Mall', snippet: 'Bus Stop'),
          position: LatLng(1.5147792750228801, 103.68524153369378)));

      _markers.add(Marker(
          markerId: MarkerId('id-9'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Skudai', snippet: 'Bus Stop'),
          position: LatLng(1.5444502610306101, 103.65785432088589)));

      _markers.add(Marker(
          markerId: MarkerId('id-10'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Taman Sri Pulai', snippet: 'Bus Stop'),
          position: LatLng(1.5673265379778765, 103.61884529855298)));

      _markers.add(Marker(
          markerId: MarkerId('id-11'),
          icon: mapMarker,
          infoWindow:
              InfoWindow(title: 'Taman Desa Skudai', snippet: 'Bus Stop'),
          position: LatLng(1.5447644987438367, 103.64404247059397)));

      _markers.add(Marker(
          markerId: MarkerId('id-12'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'U Mall', snippet: 'Bus Stop'),
          position: LatLng(1.5470525809321445, 103.6225464109877)));

      _markers.add(Marker(
          markerId: MarkerId('id-13'),
          icon: mapMarker,
          infoWindow:
              InfoWindow(title: 'AEON Taman Universiti', snippet: 'Bus Stop'),
          position: LatLng(1.5418048626564411, 103.62958645813984)));

      _markers.add(Marker(
          markerId: MarkerId('id-14'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Senai Airport', snippet: 'Bus Stop'),
          position: LatLng(1.6348450223376185, 103.66628400044834)));

      _markers.add(Marker(
          markerId: MarkerId('id-15'),
          icon: mapMarker,
          infoWindow:
              InfoWindow(title: 'Johor Premium Outlets', snippet: 'Bus Stop'),
          position: LatLng(1.6036228359066624, 103.62169772215694)));

      _markers.add(Marker(
          markerId: MarkerId('id-16'),
          icon: mapMarker,
          infoWindow:
              InfoWindow(title: 'Mid Valley Southkey', snippet: 'Bus Stop'),
          position: LatLng(1.5013448616716554, 103.77737353595447)));

      _markers.add(Marker(
          markerId: MarkerId('id-17'),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'Stulang Laut', snippet: 'Bus Stop'),
          position: LatLng(1.4692702380451284, 103.78156643374737)));
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: const Color(0xFF2B8DAA),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: IconButton(
          onPressed: _handleMenuButtonPressed,
          alignment: Alignment.topLeft,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),
        body: Stack(
          // fit: StackFit.expand,
          // alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: _onMapCreated,
              markers: _markers,
              padding: EdgeInsets.only(
                top: 325.0,
                bottom: bottomPaddingOfMap,
              ),
              polylines: polylineSet,
            ),
            Positioned(
              top: 75.0,
              left: 22.0,
              child: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6.0,
                        spreadRadius: 0.5,
                        offset: Offset(
                          0.7,
                          0.7,
                        ),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    radius: 20.0,
                  ),
                ),
              ),
            ),
            // buildFloatingSearchBar(),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: SingleChildScrollView(
                child: Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6.0),
                        Text(
                          "Hi there, ",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          "Where to?, ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 20.0),

                        GestureDetector(
                          onTap: () async {
                            var res = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()));

                            if (res == "obtainDirection") {
                              await getPlaceDirection();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text("Search Drop Off"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
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
                                Text(Provider.of<AppData>(context)
                                            .pickUpLocation !=
                                        null
                                    ? Provider.of<AppData>(context)
                                        .pickUpLocation
                                        .placeName
                                    : "Add Current Position"),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Your current address",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12.0),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        OrDivider(),
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
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12.0),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        // OrDivider(),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.favorite,
                        //       color: Colors.grey,
                        //     ),
                        //     SizedBox(
                        //       width: 12.0,
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text("Add Favourite"),
                        //         SizedBox(
                        //           height: 4.0,
                        //         ),
                        //         Text(
                        //           "Your favourite address",
                        //           style: TextStyle(
                        //               color: Colors.grey[200], fontSize: 12.0),
                        //         ),
                        //       ],
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // if (_info != null)
            // Positioned(
            //   top: 20.0,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 6.0,
            //       horizontal: 12.0,
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.yellowAccent,
            //       borderRadius: BorderRadius.circular(20.0),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.black26,
            //           offset: Offset(0, 2),
            //           blurRadius: 6.0,
            //         )
            //       ],
            //     ),
            //     child: Text(
            //       '${_info.totalDistance}, ${_info.totalDuration}',
            //       style: const TextStyle(
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            // draggableBottomSheet()
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.grey[300],
        //   foregroundColor: Colors.black,
        //   onPressed: () => _googleMapController.animateCamera(
        //     _info != null
        //         ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
        //         : CameraUpdate.newCameraPosition(_initialCameraPosition),
        //   ),
        //   child: const Icon(Icons.center_focus_strong),
        // ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    'JOHOR WHEELS',
                    style: TextStyle(
                        fontFamily: 'BebasNeue',
                        color: Colors.white,
                        fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Johor Local Bus Route Finder',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white,
                      fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 130.0,
                  height: 130.0,
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/Bus.jpg',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapScreen()));
                  },
                  leading: Icon(Icons.explore),
                  title: Text('Explore'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusInfoScreen()));
                  },
                  leading: Icon(Icons.directions_bus),
                  title: Text('Bus Information'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleFareScreen()));
                  },
                  leading: Icon(Icons.schedule),
                  title: Text('Schedule & Fare'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TourGuideScreen()));
                  },
                  leading: Icon(Icons.tour),
                  title: Text('Tour Guide'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouriteScreen()));
                  },
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()));
                  },
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    AuthServices.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Sign Out'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Where are you going to?',
      hintStyle: TextStyle(
          fontFamily: 'Campton', fontSize: 17.5, color: Colors.black45),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TourGuideScreen()));
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Future<void> getPlaceDirection() async {
    var initialPos =
        Provider.of<AppData>(context, listen: false).pickUpLocation;
    var finalPos = Provider.of<AppData>(context, listen: false).dropOffLocation;

    var pickUpLatLng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropOffLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    var details = await AssistantMethods.obtainPlaceDirectionDetails(
        pickUpLatLng, dropOffLatLng);

    Navigator.pop(context);

    print("This is encoded Points :: ");
    print(details.encodedPoints);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResult =
        polylinePoints.decodePolyline(details.encodedPoints);

    pLineCoordinates.clear();

    if (decodedPolyLinePointsResult.isNotEmpty) {
      decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId("PolylineID"),
        color: Colors.red,
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polylineSet.add(polyline);
    });
  }

  // void _addMarker(LatLng pos) async {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     // Origin is not set OR Origin/Destination are both set
  //     // Set origin
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos,
  //       );
  //       // Reset destination
  //       _destination = null;

  //       // Reset info
  //       _info = null;
  //     });
  //   } else {
  //     // Origin is already set
  //     // Set destination
  //     setState(() {
  //       _destination = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //       );
  //     });

  //     // Get directions
  //     final directions = await DirectionsRepository()
  //         .getDirections(origin: _origin.position, destination: pos);
  //     setState(() => _info = directions);
  //   }
  // }

  // Widget draggableBottomSheet() {
  //   List<IconData> icons = [
  //     Icons.ac_unit,
  //     Icons.account_balance,
  //     Icons.adb,
  //     Icons.add_photo_alternate,
  //     Icons.format_line_spacing
  //   ];

  //   return Scaffold(
  //       body: DraggableBottomSheet(
  //     previewChild: Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //           color: Color(0xFF2B8DAA),
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             width: 40,
  //             height: 6,
  //             decoration: BoxDecoration(
  //                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
  //           ),
  //           SizedBox(
  //             height: 8,
  //           ),
  //           Text(
  //             'Favourites',
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(
  //             height: 16,
  //           ),
  //           Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: icons.map((icon) {
  //                 return Container(
  //                   width: 50,
  //                   height: 50,
  //                   margin: EdgeInsets.only(right: 16),
  //                   child: Icon(
  //                     icon,
  //                     color: Color(0xFF2B8DAA),
  //                     size: 40,
  //                   ),
  //                   decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10)),
  //                 );
  //               }).toList())
  //         ],
  //       ),
  //     ),
  //     expandedChild: Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //           color: Color(0xFF2B8DAA),
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //       child: Column(
  //         children: <Widget>[
  //           Icon(
  //             Icons.keyboard_arrow_down,
  //             size: 30,
  //             color: Colors.white,
  //           ),
  //           SizedBox(
  //             height: 8,
  //           ),
  //           Text(
  //             'Favourites',
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(
  //             height: 16,
  //           ),
  //           Expanded(
  //             child: GridView.builder(
  //                 itemCount: icons.length,
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 2,
  //                   crossAxisSpacing: 10,
  //                   mainAxisSpacing: 10,
  //                 ),
  //                 itemBuilder: (context, index) => Container(
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(10)),
  //                       child: Icon(
  //                         icons[index],
  //                         color: Color(0xFF2B8DAA),
  //                         size: 40,
  //                       ),
  //                     )),
  //           )
  //         ],
  //       ),
  //     ),
  //     minExtent: 150,
  //     maxExtent: MediaQuery.of(context).size.height * 0.8,
  //   ));
  // }
}

class Utils {
  static String mapStyle = '''
  [
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#263c3f"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#6b9a76"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#38414e"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#212a37"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9ca5b3"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#1f2835"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#f3d19c"
        }
      ]
    },
    {
      "featureType": "road.local",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "transit",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#2f3948"
        }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#515c6d"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    }
  ]
  ''';
}
