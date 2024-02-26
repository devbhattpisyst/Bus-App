// import 'dart:async';
// import 'dart:developer';
// import 'package:bus/geo/locator.dart';
// import 'package:bus/models/driver/driver_login_model.dart';
// import 'package:bus/models/passenger/all_trips_model.dart';
// import 'package:bus/provider/all_bus_stop_provider.dart';
// import 'package:bus/provider/driver_login_provider.dart';
// import 'package:bus/provider/driver_trip_provider.dart';
// import 'package:bus/view/driver/dashboard/driver_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class DriverDashController extends GetxController {
//   TextEditingController descController = TextEditingController();
//   var driverTripdetails = <DriverData>[].obs;
//   var updatedTripdetails = <DriverData>[].obs;

//   // var driverTripStatusData = <Driver>[];
//   var currentTripindex = 0;
//   late Timer timer;
//   RxBool started = false.obs;
//   RxBool problemOccured = false.obs;
//   RxBool reached = false.obs;
//   RxBool halted = false.obs;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     driverTripdetails = RxList<DriverData>.from(Get.arguments[0]['data']);
//     updatedTripdetails = RxList<DriverData>.from(Get.arguments[0]['data']);
//     // activeTripDetails = RxList<DriverData>.from(Get.arguments[0]['data']);

//     print("Trip details\n" + driverTripdetails.toString());
//     super.onInit();
//   }

//   Future<void> refreshData() async {
//     await ActivatedTrips();
//   }

//   Future<void> lauchgoogleMaps(lat, long) async {
//     if (!await launchUrl(
//       Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long'),
//       mode: LaunchMode.platformDefault,
//     )) {
//       throw Exception('Could not launch Maps');
//     }
//   }

//   startTrip() async {
//     await DriverTripProvider()
//         .startTrip({"tripId": driverTripdetails[currentTripindex].tripId}).then(
//             (value) async {
//       if (value != null) {
//         started.value = true;
//         await refreshData();
//         startRunner();
//       }
//     });
//   }

//   ActivatedTrips() {
//     log("Calling this function Activated Trips");
//     log("This is driver id as parameter : " +
//         driverTripdetails[currentTripindex].driverID);
//     DriverTripProvider().ActiveBusTrips({
//       "DriverID": driverTripdetails[currentTripindex].driverID
//     }).then((value) {
//       driverTripdetails.clear();
//       if (value != null) {
//         if (value.payload.data.isNotEmpty) {
//           log("Updating");
//           driverTripdetails.addAll(value.payload.data);
//           log("Updated");
//         }
//       }
//     });
//     log("response getting from the activated trips ${driverTripdetails}");
//     // for(var x in driverTripdetails){
//     //   lo
//     // }
//   }

//   startRunner() async {
//     timer = Timer.periodic(Duration(seconds: 10), (Timer timer) async {
//       Position loc = await determinePosition();
//       // log("${loc.latitude} , ${loc.longitude}");
//       updatelocation(loc.latitude, loc.longitude);
//     });
//   }

//   updatelocation(lat, long) {
//     DriverTripProvider().tripLocationUpdate({
//       "BusId": driverTripdetails[currentTripindex].busId,
//       "latitude": 45,
//       "longitude": 90
//     });
//   }

//   reachedTrip() async {
//     await DriverTripProvider().reachedTrip({
//       "tripId": driverTripdetails[currentTripindex].tripId
//     }).then((value) async {
//       if (value != null) {
//         reached.value = true;
//         await refreshData();
//         timer.cancel();
//       }
//     });
//   }

//   sendSOS(context) async {
//     await refreshData();
//     Position loc = await determinePosition();
//     await DriverTripProvider().sosTrip({
//       "tripId": driverTripdetails[currentTripindex].tripId,
//       "description": descController.text,
//       "latitude": loc.latitude,
//       "longitude": loc.longitude
//     });
//     problemOccured.value = true;
//     Navigator.pop(context);
//     descController.clear();
//   }

//   sos(context) {
//     return const DriverDashboard().bottomSheet(context);
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:bus/geo/locator.dart';
import 'package:bus/models/driver/driver_login_model.dart';
import 'package:bus/models/passenger/all_trips_model.dart';
import 'package:bus/provider/all_bus_stop_provider.dart';
import 'package:bus/provider/driver_login_provider.dart';
import 'package:bus/provider/driver_trip_provider.dart';
import 'package:bus/view/driver/dashboard/driver_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverDashController extends GetxController {
  TextEditingController descController = TextEditingController();
  var driverTripdetails = <DriverData>[].obs;

  var currentTripindex = 0;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    driverTripdetails = RxList<DriverData>.from(Get.arguments[0]['data']);

    super.onInit();
  }

  Future<void> refreshData() async {
    await ActivatedTrips();
  }

  Future<void> lauchgoogleMaps(lat, long) async {
    if (!await launchUrl(
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long'),
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch Maps');
    }
  }

  startTrip() async {
    await DriverTripProvider()
        .startTrip({"tripId": driverTripdetails[currentTripindex].tripId}).then(
            (value) async {
      if (value != null) {
        await refreshData();
        startRunner();
      }
    });
  }

  ActivatedTrips() {
    log("Calling this function Activated Trips");

    DriverTripProvider().ActiveBusTrips({
      "DriverID": driverTripdetails[currentTripindex].driverID
    }).then((value) {
      driverTripdetails.clear();
      if (value != null) {
        if (value.payload.data.isNotEmpty) {
          driverTripdetails.addAll(value.payload.data);
        }
      }
    });
    log("response getting from the activated trips");
    // for(var x in driverTripdetails){
    //   lo
    // }
  }

  startRunner() async {
    timer = Timer.periodic(Duration(seconds: 10), (Timer timer) async {
      Position loc = await determinePosition();
      // log("${loc.latitude} , ${loc.longitude}");
      updatelocation(loc.latitude, loc.longitude);
    });
  }

  updatelocation(lat, long) {
    DriverTripProvider().tripLocationUpdate({
      "BusId": driverTripdetails[currentTripindex].busId,
      "latitude": 45,
      "longitude": 90
    });
  }

  reachedTrip() async {
    await DriverTripProvider().reachedTrip({
      "tripId": driverTripdetails[currentTripindex].tripId
    }).then((value) async {
      if (value != null) {
        await refreshData();
        timer.cancel();
      }
    });
  }

  sendSOS(context) async {
    await refreshData();
    Position loc = await determinePosition();
    await DriverTripProvider().sosTrip({
      "tripId": driverTripdetails[currentTripindex].tripId,
      "description": descController.text,
      "latitude": loc.latitude,
      "longitude": loc.longitude
    });
    Navigator.pop(context);
    descController.clear();
  }

//   Future<int> inProgress() async {
//   Map<String, dynamic> response = await DriverTripProvider().tripstatus({
//     "tripstatus": driverTripdetails[tripStatusDetails].tripStatus
//   });
//   int tripStatus =
//   print('Extracted Trip Status: $tripStatus');

//   return tripStatus;
// }

  sos(context) {
    return const DriverDashboard().bottomSheet(context);
  }
}
