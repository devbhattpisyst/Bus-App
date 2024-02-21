import 'dart:convert';
import 'dart:developer';

import 'package:bus/models/driver/driver_login_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';

class DriverLoginProvider extends GetConnect {
  Future<DriverLoginResponseModel?> loginAsDriver(jsonArray) async {
    try {
      print(jsonArray);
      Response response = await post(
          "${Constants.baseUrl}Bus/loginDriver", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final body = json.decode(json.encode(response.body));
      log("This is response : " + response.body.toString());
      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        return driverLoginResponseModelFromJson(response.bodyString.toString());
      } else {
        return driverLoginResponseModelFromJson(response.bodyString.toString());
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
