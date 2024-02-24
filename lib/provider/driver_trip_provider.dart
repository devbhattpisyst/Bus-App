import 'dart:convert';
import 'dart:developer';

import 'package:bus/models/SubRoutes/get_subroutes_response_model.dart';
import 'package:bus/models/driver/driver_login_model.dart';
import 'package:bus/models/driver/driver_signup_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

class DriverTripProvider extends GetConnect {
  Future startTrip(jsonArray) async {
    print(jsonArray);
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/startTrip", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final body = json.decode(json.encode(response.body));

      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        if (body['success'] == true) {
          Get.snackbar("Success", body['payload']['message']);
          return body;
        } else {
          Get.snackbar("Alert", "${body['error']['message']}");
          return null;
        }
      } else {}
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  // Future<SubRoutesResponseModel?> getAllSubRoutesFromAStop(jsonArray) async {
  //   try {
  //     Response response = await post(
  //       "${Constants.baseUrl}Bus/fetchSubroutesByRouteID",
  //       jsonEncode(jsonArray),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     final responseBody = response.bodyString.toString();
  //     log("this is our response body of subroutes -->$responseBody");

  //     if (response.statusCode == 200) {
  //       var parsedResponse = json.decode(responseBody);
  //       if (parsedResponse['success'] == true) {
  //         log("Succeed ho gaye hai...");
  //         return subRoutesResponseModelFromJson(responseBody);
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       log("Request failed with status code -->${response.statusCode}");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //     return null;
  //   }
  // }

  Future<DriverLoginResponseModel?> ActiveBusTrips(jsonArray) async {
    print(jsonArray);
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/ActiveTrip", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var responseBody = response.bodyString.toString();

      log(responseBody.toString());

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(responseBody);
        if (parsedResponse['success'] == true) {
          return driverLoginResponseModelFromJson(responseBody);
        } else {
          return Future.error(parsedResponse['error']['message']);
        }
      }
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return Future.error("Error" + e.toString());
    }
  }

  Future reachedTrip(jsonArray) async {
    print(jsonArray);
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/endTrip", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final body = json.decode(json.encode(response.body));
      log(body.toString());

      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        if (body['success'] == true) {
          Get.snackbar("Success", body['payload']['message']);
          return body;
        } else {
          Get.snackbar("Alert", "${body['error']['message']}");
          return null;
        }
      } else {}
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future sosTrip(jsonArray) async {
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/SOSTrip", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final body = json.decode(json.encode(response.body));
      log(body.toString());

      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        if (body['success'] == true) {
          Get.snackbar("Success", body['payload']['message']);
        } else {
          Get.snackbar("Alert", "${body['error']['message']}");
        }
      } else {}
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  Future tripLocationUpdate(jsonArray) async {
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/RunnerBus", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final body = json.decode(json.encode(response.body));

      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        if (body['success'] == true) {
          // Get.snackbar("Success", body['payload']['message']);
          log(body['payload']['message'].toString());
        } else {
          Get.snackbar("Alert", "${body['error']['message']}");
        }
      } else {}
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return null;
    }
  }
}
