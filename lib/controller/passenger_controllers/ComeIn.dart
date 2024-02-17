import 'package:bus/controller/passenger_controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ComeInDashboard extends GetView<DashboardController> {
  const ComeInDashboard({super.key});

  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Look A Ride"),
        // leading: SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Get.offAndToNamed("/login");
              },
              child: const Text(
                "Logout",
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: controller.loading.value == false
              ? SizedBox(
                  height: size.height,
                  child: Column(
                    children: [
                      SizedBox(),
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: TabBarView(
                              controller: controller.tabController,
                              children: [
                                BusStopList(),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      padding: EdgeInsets.all(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer
                                          .withOpacity(.1),
                                      child: Column(
                                        children: [],
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  ListView BusStopList() {
    return ListView.builder(
      itemCount: controller.busstoparray.length,
      itemBuilder: (context, index) {
        final trip = controller.busstoparray[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: Icon(Icons.bus_alert),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${trip.driverFirstName} ${trip.driverLastName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${trip.startTime}',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  Text(
                    '${trip.startRoutepoint} -> ${trip.endRoutepoint}',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  // Text('End Route Point: ${trip['endRoutepoint']}'),
                ],
              ),
              subtitle: Text('Bus Number: ${trip.busNumber}'),
              onTap: () {
                launchUrl(Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=${DashboardController.latitude},${DashboardController.longitude}'));
              },
            ),
          ),
        );
      },
    );
  }
}

// import 'dart:convert';

// import 'package:bus/controller/passenger_controllers/dashboard_controller.dart';
// import 'package:bus/geo/locator.dart';
// import 'package:bus/provider/bus_stops_details_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// // Assuming your JSON response is stored in a variable called `response`
// String jsonResponse = '''
// {
//   "success": true,
//   "payload": {
//     "message": "Trips fetched successfully!",
//     "data": [
//       {
//         "TripID": "2",
//         "RouteID": "2",
//         "DriverID": "5",
//         "BusID": "2",
//         "StartTime": "2024-01-13 19:01:08",
//         "Status": "2",
//         "driverFirstName": "sid",
//         "driverLastName": "ved",
//         "BusNumber": "8967",
//         "startRoutepoint": "Vimannagar",
//         "endRoutepoint": "Kharadi"
//       },
//       {
//         "TripID": "3",
//         "RouteID": "2",
//         "DriverID": "2",
//         "BusID": "1",
//         "StartTime": "2024-01-13 16:13:58",
//         "Status": "2",
//         "driverFirstName": "sdfgh",
//         "driverLastName": "defghj",
//         "BusNumber": "8745",
//         "startRoutepoint": "Vimannagar",
//         "endRoutepoint": "Kharadi"
//       },
//       {
//         "TripID": "6",
//         "RouteID": "2",
//         "DriverID": "5",
//         "BusID": "5",
//         "StartTime": "2024-01-13 17:29:29",
//         "Status": "1",
//         "driverFirstName": "sid",
//         "driverLastName": "ved",
//         "BusNumber": "7657",
//         "startRoutepoint": "Vimannagar",
//         "endRoutepoint": "Kharadi"
//       },
//       {
//         "TripID": "7",
//         "RouteID": "2",
//         "DriverID": "5",
//         "BusID": "2",
//         "StartTime": "2024-01-13 18:20:04",
//         "Status": "1",
//         "driverFirstName": "sid",
//         "driverLastName": "ved",
//         "BusNumber": "8967",
//         "startRoutepoint": "Vimannagar",
//         "endRoutepoint": "Kharadi"
//       }
//     ]
//   },
//   "error": {
//     "code": 0,
//     "message": ""
//   }
// }
// ''';

// // void main() {
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: ComeIn(response: jsonResponse),
//     );
//   }
// }

// class ComeIn extends GetView<DashboardController> {
//   final String response;
//   ComeIn({super.key, required this.response});
//   @override
//   Widget build(BuildContext context) {
//     // print("Latitude is : " + lat);
//     // print("Longitude is : " + long);
//     final parsedResponse = jsonDecode(response);
//     final data = parsedResponse['payload']['data'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bus Stop Details'),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           final trip = data[index];
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListTile(
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                 leading: Icon(Icons.bus_alert),
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${trip['driverFirstName']} ${trip['driverLastName']}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '${trip['StartTime']}',
//                       style: TextStyle(color: Colors.blueAccent),
//                     ),
//                     Text(
//                       '${trip['startRoutepoint']} -> ${trip['endRoutepoint']}',
//                       style: TextStyle(color: Colors.redAccent),
//                     ),
//                     // Text('End Route Point: ${trip['endRoutepoint']}'),
//                   ],
//                 ),
//                 subtitle: Text('Bus Number: ${trip['BusNumber']}'),
//                 onTap: () {
//                   launchUrl(Uri.parse(
//                       'https://www.google.com/maps/search/?api=1&query=${DashboardController.latitude},${DashboardController.longitude}'));
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
