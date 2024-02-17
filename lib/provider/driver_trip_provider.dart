import 'dart:convert';
import 'dart:developer';

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
