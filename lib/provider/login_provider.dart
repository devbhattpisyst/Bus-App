import 'dart:convert';

import 'package:bus/models/passenger/all_bus_stops_model.dart';
import 'package:bus/models/passenger/passenger_login_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';

class PassengerLoginProvider extends GetConnect {
  Future<LoginResponseModel?> login(jsonArray) async {
    try {
      print(jsonArray);

      Response response =
          await post("${Constants.baseUrl}Bus/loginUser", jsonEncode(jsonArray), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      final body = json.decode(json.encode(response.body));

      // print("body \n" + body['error']['code']);
      if (response.statusCode == 200) {
        if (body['error']['code'] == 0)
          return loginResponseModelFromJson(response.bodyString.toString());
        else
          Get.snackbar("Error", body['error']['message']);
      } else {
        Get.snackbar("Error", body['error']['message']);

        // return loginResponseModelFromJson(response.bodyString.toString());
      }
    } catch (e) {
      print(
        "object" + e.toString(),
      );
      Get.snackbar("Error", e.toString());
      return null;
    }
  }
}
