import 'package:flutter/material.dart';
import 'package:gps_tracker_flutter/location_service.dart';
import 'package:gps_tracker_flutter/user_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LocationService locationService = LocationService();
  double? latitude = 0;
  double? longitude = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationService.locationStream.listen((UserLocation) {
      setState(() {
        latitude = UserLocation.latitude;
        longitude = UserLocation.longitude;
      });
    });
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Realtime Update for User Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude'),
            Text(
              '${latitude}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Longitude'),
            Text(
              '${longitude}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}


  //  body: StreamBuilder<UserLocation>(
  //         stream: locationService.locationStream,
  //         builder: (_, snapshot) => (snapshot.hasData)
  //             ? Center(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text('Latitude:'),
  //                     Text(
  //                       '${snapshot.data?.latitude}',
  //                       style: TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.bold),
  //                     ),
  //                     SizedBox(
  //                       height: 15,
  //                     ),
  //                     Text(
  //                       '${snapshot.data?.longitude}',
  //                       style: TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.bold),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             : SizedBox(),
  //       )