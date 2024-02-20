import 'dart:async';
import 'dart:developer';
import 'package:bus/geo/locator.dart';
import 'package:bus/models/driver/driver_login_model.dart';
import 'package:bus/provider/all_bus_stop_provider.dart';
import 'package:bus/provider/driver_trip_provider.dart';
import 'package:bus/view/driver/dashboard/driver_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverDashController extends GetxController {
  TextEditingController descController = TextEditingController();
  var driverTripdetails = <DriverData>[];
  var currentTripindex = 0;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    driverTripdetails = Get.arguments[0]['data'];
    print("Trip details\n" + driverTripdetails.toString());
    super.onInit();
  }

  Future<void> lauchgoogleMaps(lat, long) async {
    if (!await launchUrl(
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long'),
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch Maps');
    }
  }

  startTrip() {
    DriverTripProvider().startTrip(
        {"tripId": driverTripdetails[currentTripindex].tripId}).then((value) {
      if (value != null) {
        startRunner();
      }
    });
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

  reachedTrip() {
    DriverTripProvider().reachedTrip(
        {"tripId": driverTripdetails[currentTripindex].tripId}).then((value) {
      if (value != null) {
        timer.cancel();
      }
    });
  }

  sendSOS(context) async {
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
