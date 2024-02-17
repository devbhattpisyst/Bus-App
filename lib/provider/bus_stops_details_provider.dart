import 'dart:convert';
import 'dart:developer';

import 'package:bus/models/Trips/getTripsResponse.dart';
import 'package:bus/models/passenger/all_bus_stops_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';

class BusStopsDetailsProvider extends GetConnect {
  Future<TripsModel?> getBusStopDetails(jsonArray) async {
    try {
      log("This is json Array " + jsonArray.toString());
      Response response = await post(
          "${Constants.baseUrl}Bus/getTripByStop", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      var responseBody = response.bodyString.toString();
      log("hiii =>" + response.body.toString());

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(responseBody);
        if (parsedResponse['success'] == true) {
          return tripsModelFromJson(responseBody);
        } else {
          return Future.error(parsedResponse['error']['message']);
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
      return null;
    }
  }
}
