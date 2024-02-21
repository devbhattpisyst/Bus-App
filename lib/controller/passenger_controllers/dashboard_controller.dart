import 'dart:convert';
import 'dart:developer' show log;
import 'package:bus/geo/locator.dart';
import 'package:bus/models/Trips/getTripsResponse.dart';
import 'package:bus/models/passenger/all_bus_stops_model.dart';
import 'package:bus/models/passenger/all_trips_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bus/provider/all_bus_stop_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provider/bus_stops_details_provider.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  // TabController(length: 2, vsync: this); // Initialize TabController here;
  var loading = true.obs;
  var busStopsSorted = <BusStop>[].obs;

  var busStops = <BusStop>[].obs;
  //var busStopsDetails = <Trip>[].obs;
  var filteredTrips = [].obs;
  var busstoparray = <Trip>[].obs;
  var trips = <TripData>[].obs;
  static var latitude;
  static var longitude;
  String terminal1 = "";
  String terminal2 = "";
  List<dynamic> filteredList = [];
  var busstop = 0;
  @override
  void onInit() async {
    super.onInit();
    Position? loc = await determinePosition();
    busstop = 17;
    latitude = loc?.latitude;
    longitude = loc?.longitude;
    tabController =
        TabController(length: 2, vsync: this); // Initialize TabController here

    await getBusStopsSortedByDistance();
    // await getBusStopDetails(Trip.fromJson({}).busId);
    getTrips();
  }

  SearchStartRoutePoint() {
    filteredTrips.clear(); // Clear the previous results
    log("calling....");
    filteredTrips.addAll(trips.where((trip) {
      return trip.startRoutePoint
              .toLowerCase()
              .contains(terminal1.toLowerCase()) &&
          trip.endRoutePoint.toLowerCase().contains(terminal2.toLowerCase());
    }).toList());
  }

  SearchEndRoutePoint() {
    filteredTrips.clear();
    log("Calling....");
    filteredTrips.addAll(trips.where((trip) {
      return trip.endRoutePoint
              .toLowerCase()
              .contains(terminal2.toLowerCase()) &&
          trip.startRoutePoint.toLowerCase().contains(terminal1.toLowerCase());
    }).toList());
  }

  getstopsdetails(busstopid) async {
    // log("calling");
    try {
      var value = await BusStopsDetailsProvider()
          .getBusStopDetails({"busstop": busstop});
      if (value != null) {
        busstoparray.value = value.payload.data;
        log("hello we are bus stop details  => " + value.toString());
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }

  // getstopsdetails() async {
  //   log("calling");
  //   await BusStopProvider().getstopsdetails({"busstop": busstop}).then((value) {
  //     if (value != null) {
  //       busstoparray.value = value.payload.data;
  //       log("getBusStopsSortedByDistance => " + value.toString());
  //     }
  //   });
  //   loading.value = false;
  // }

  // void getBusStops() async {
  //   await BusStopProvider().getBusStops({
  //     "latitude": lat,
  //     "longitude": long,
  //   }).then((value) {
  //     if (value != null) {
  //       busStops.value = value.payload.data;
  //       print(busStops.value);
  //     }
  //   });
  //   loading.value = false;
  // }
// --------------------------------------------------------------------------------
  getBusStopsSortedByDistance() async {
    log("calling");
    await BusStopProvider().getBusStopsSortedByDistance({
      "latitude": latitude,
      "longitude": longitude,
    }).then((value) {
      if (value != null) {
        busStopsSorted.value = value.payload.data;
        log("getBusStopsSortedByDistance => " + value.toString());
      }
    });
    loading.value = false;
  }

// -----------------------------------------------------------------------------------
  void getTrips() async {
    await BusStopProvider().getTrips().then((value) {
      if (value != null) {
        print(busStops.value);
        trips.value = value.payload.data;
      }
    });
    loading.value = false;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> lauchgoogleMaps(lat, long) async {
    if (!await launchUrl(
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long'),
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch Maps');
    }
  }

  status(val) {
    // log(val);
    switch (val) {
      case 1:
        if (val == 1) return "InProgress";
      case 2:
        return "Completed";
      case 3:
        return "SOS";
      case 4:
        return "halted";
      default:
        return "Unknown";
    }
  }
}
