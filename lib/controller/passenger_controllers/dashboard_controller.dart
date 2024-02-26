import 'dart:convert';
import 'dart:developer' show log;
import 'package:bus/geo/locator.dart';
import 'package:bus/models/SubRoutes/get_subroutes_response_model.dart';
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
  bool emptyData = false;
  var busStopsSorted = <BusStop>[].obs;
  var substops = <SubRoutes>[].obs;

  var source;
  var destination;
  var startTime;
  var routeId;
  var busNumber;

  var busStops = <BusStop>[].obs;
  //var busStopsDetails = <Trip>[].obs;
  var filteredTrips = <Trip>[].obs;

  var busstoparray = <Trip>[].obs;

  var trips = <TripData>[].obs;
  var latitude;
  var longitude;
  String terminal1 = "";
  String terminal2 = "";
  var indexParsing = 0;

  var currentIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    Position? loc = await determinePosition();

    latitude = loc?.latitude;
    longitude = loc?.longitude;

    tabController =
        TabController(length: 2, vsync: this); // Initialize TabController here

    await getBusStopsSortedByDistance();
    getTrips();
  }

  AllSubStopsDetails(routeId) async {
    await BusStopProvider().getAllSubRoutesFromAStop(
        {"RouteID": routeId.toString()}).then((value) {
      if (value != null) {
        log("i am accessing value");
        substops.value = value.payload.data;
      }
    });
  }
  // kharadi --> hinjewadi.

  getStopDetails(busstop) async {
    // loading.value = true; // Show loading indicator
    busstoparray.clear();
    await BusStopProvider().getstopsdetails({"busstop": busstop}).then((value) {
      busstoparray.clear();
      log("responce => ${jsonDecode(jsonEncode(value))}");
      log("hie i am sid");
      if (value != null && value.payload.data.isNotEmpty) {
        busstoparray.addAll(List.from(value.payload.data));
        log("list offf => ${value.payload.data}");
      } else {
        // Handle the case when the data is null or empty
        log("Data is null or empty");
        // Set an empty list to clear any existing data
        emptyData = true;
      }
    }).catchError((error) {
      // Handle any errors that occur during the API call
      Get.snackbar("Error", error.toString());
    }).whenComplete(() {
      loading.value = false; // Hide loading indicator
    });
  }

  getSubRoutes() async {
    filteredTrips.clear();
    // loading.value = true;
    log("The value of terminal 1 is : " + terminal1.toString());
    log("The value of terminal 2 is : " + terminal2.toString());
    log("Calling sub routes controllers...");
    await BusStopProvider().get_Sub_Routes({
      "start": terminal1.toString(),
      "end": terminal2.toString()
    }).then((value) {
      log("Inside we go --> ${value}");
      if (value != null) {
        filteredTrips.value = value.payload.data.cast<Trip>();
      }
    });
    loading.value = false;
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
