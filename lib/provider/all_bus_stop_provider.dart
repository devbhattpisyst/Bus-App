import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:bus/models/SubRoutes/get_subroutes_response_model.dart';
import 'package:bus/models/Trips/getTripsResponse.dart';
import 'package:bus/models/passenger/all_bus_stops_model.dart';
import 'package:bus/models/passenger/all_trips_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';

class BusStopProvider extends GetConnect {
  // Future<BusStopsModel?> getBusStops(jsonArray) async {
  //   try {
  //     Response response = await post(
  //         "${Constants.baseUrl}Bus/sortedBusStop", jsonEncode(jsonArray),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         });
  //     print(response.body.toString());

  //     if (response.statusCode == 200) {
  //       return busStopsModelFromJson(response.bodyString.toString());
  //     } else {
  //       return Future.error(response.statusText.toString());
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //     return null;
  //   }
  // }

  Future<TripsModel?> get_Sub_Routes(jsonArray) async {
    log("This is json Array" + jsonArray.toString());

    try {
      Response response = await post(
        "${Constants.baseUrl}Bus/getTripBySubRoutes",
        jsonEncode(jsonArray),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var responseBody = response.bodyString.toString();

      log("This is response body : " + responseBody);
      log("Response status code: " + response.statusCode.toString());

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(responseBody);
        if (parsedResponse['success'] == true) {
          log("Success mili hai...");
          return tripsModelFromJson(responseBody);
        } else {
          return null;
        }
      } else {
        log("Request failed with status: " + response.statusCode.toString());
      }
    } catch (e) {
      print("object" + e.toString());
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future<SubRoutesResponseModel?> getAllSubRoutesFromAStop(jsonArray) async {
    try {
      Response response = await post(
        "${Constants.baseUrl}Bus/fetchSubroutesByRouteID",
        jsonEncode(jsonArray),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final responseBody = response.bodyString.toString();
      log("this is our response body of subroutes -->$responseBody");

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(responseBody);
        if (parsedResponse['success'] == true) {
          log("Succeed ho gaye hai...");
          return subRoutesResponseModelFromJson(responseBody);
        } else {
          return null;
        }
      } else {
        log("Request failed with status code -->${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future<BusStopsModel?> getBusStopsSortedByDistance(jsonArray) async {
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/sortedBusStop", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      var responseBody = response.bodyString.toString();
      log("hiii =>" + responseBody);

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(responseBody);
        if (parsedResponse['success'] == true) {
          return busStopsModelFromJson(responseBody);
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

  // Future<TripsModel?> get_Sub_Routes(jsonArray) async {
  //   log("This is json Array" + jsonArray.toString());

  //   try {
  //     Response response = await post(
  //       "${Constants.baseUrl}Bus/getTripBySubRoutes",
  //       jsonEncode(jsonArray),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     var responseBody = response.bodyString.toString();

  //     log("This is response body : " + responseBody);
  //     log("Response status code: " + response.statusCode.toString());

  //     if (response.statusCode == 200) {
  //       var parsedResponse = json.decode(responseBody);
  //       if (parsedResponse['success'] == true) {
  //         log("Success mili hai...");
  //         return tripsModelFromJson(responseBody);
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       log("Request failed with status: " + response.statusCode.toString());
  //     }
  //   } catch (e) {
  //     print("object" + e.toString());
  //     Get.snackbar("Error", e.toString());
  //     return null;
  //   }
  // }

  Future<TripsModel?> getstopsdetails(jsonArray) async {
    log("This is json Array " + jsonArray.toString());
    try {
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
          return null;
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      log("Exception => ${e}  ");
      return null;
    }
  }

  Future<AllTripsResponseModel?> getTrips() async {
    try {
      Response response = await get("${Constants.baseUrl}Bus/getAllTrips",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      final body = json.decode(json.encode(response.body));

      if (response.statusCode == 200) {
        if (body['error']['code'] == 0) {
          return allTripsResponseModelFromJson(response.bodyString.toString());
        } else {
          Get.snackbar("Error", body['error']['message']);
        }
      } else {
        return Future.error(response.statusText.toString());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }
}
