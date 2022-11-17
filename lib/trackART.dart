import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class trackLocationART extends StatefulWidget {
  const trackLocationART({Key? key}) : super(key: key);
  _trackLocationART createState() => _trackLocationART();
}

class _trackLocationART extends State<trackLocationART> {
  var _latitude = '';
  var _longitude = '';
  var _altitude = '';
  var _speed = '';
  var _address = '';
  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();
      _speed = pm[0].toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnalbled;
    LocationPermission permission;
    serviceEnalbled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnalbled) {
      return Future.error("Location Disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission Denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Request permission denied forever');
    }
    return await Geolocator.getCurrentPosition();
  }

  Widget build(BuildContext context) {
    // DocumentReference docUser =
    //     FirebaseFirestore.instance.collection('ART').doc();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Last Location'),
              Text(
                "Latitude : " + _latitude,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Longitude : " + _longitude,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Altitude : " + _altitude,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Speed : " + _speed,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Address : ",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                _address,
              ),
              ElevatedButton(
                  onPressed: _updatePosition, child: Text("Update Lokasi")),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.green,
      //   child: IconTheme(
      //     data: const IconThemeData(color: Colors.white, size: 36),
      //     child: Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 40),
      //           child: IconButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => cleanhomeART2()));
      //               },
      //               icon: const Icon(Icons.home)),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 40),
      //           child: IconButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => trackLocation()));
      //               },
      //               icon: const Icon(Icons.location_on)),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 40),
      //           child: IconButton(
      //               onPressed: () {}, icon: const Icon(Icons.payment)),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 40),
      //           child: IconButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => pilihMenuART()));
      //               },
      //               icon: const Icon(Icons.supervisor_account_rounded)),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
