import 'dart:async';
import 'dart:developer';

import 'package:bus/geo/locator.dart';
import 'package:bus/models/driver/driver_login_model.dart';
import 'package:bus/models/passenger/all_trips_model.dart';
import 'package:bus/provider/all_bus_stop_provider.dart';
import 'package:bus/provider/driver_trip_provider.dart';
import 'package:bus/view/driver/dashboard/driver_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverDashController extends GetxController {
  TextEditingController descController = TextEditingController();
  var driverTripdetails = <DriverData>[].obs;
  var activeTripDetails = <DriverData>[].obs;
  late RxBool tripStarted;
  late RxBool tripReached;
  late RxBool sosOccured;

  // var driverTripStatusData = <Driver>[];
  var currentTripindex = 0;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit

    driverTripdetails = RxList<DriverData>.from(Get.arguments[0]['data']);

    activeTripDetails = RxList<DriverData>.from(Get.arguments[0]['data']);
    tripStarted = false.obs;
    tripReached = false.obs;
    sosOccured = false.obs;
    print("Trip details\n" + driverTripdetails.toString());
    super.onInit();
  }

  Future<void> refreshData() async {
    // driverTripdetails.clear();
    await ActivatedTrips();
    // Update driverTripdetails with the updated data from activeTripDetails
    driverTripdetails.value = activeTripDetails.toList();
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

// bus number = 6789 , trip number = 24 , hadapasar --> swargate.
  ActivatedTrips() async {
    log("Calling this function Activated Trips");

    await DriverTripProvider().ActiveBusTrips({
      "DriverID": driverTripdetails[currentTripindex].driverID.toString()
    }).then((value) {
      log("The bus id is : " + driverTripdetails[currentTripindex].busId);
      if (value != null) {
        // driverTripdetails = value.payload.data;
        // driverTripdetails.clear();
        activeTripDetails.value = value.payload.data;
        // log("This is active trips :  ${activeTripDetails}");
        driverTripdetails.value = List.from(activeTripDetails.toList());
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
    DriverTripProvider().sosTrip({
      "tripId": driverTripdetails[currentTripindex].tripId,
      "description": descController.text,
      "latitude": loc.latitude,
      "longitude": loc.longitude
    });
    Navigator.pop(context);
    descController.clear();
  }

  sos(context) {
    return const DriverDashboard().bottomSheet(context);
  }
}
