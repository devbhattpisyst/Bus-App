import 'dart:convert';

import 'package:bus/models/driver/driver_signup_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';

class DriverSignupProvider extends GetConnect {
  Future<DriverSignupResponseModel?> signUp(jsonArray) async {
    try {
      Response response = await post(
          "${Constants.baseUrl}Bus/registrationDriver", jsonEncode(jsonArray),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      final body = json.decode(json.encode(response.body));
      print("body \n$body");
      if (response.statusCode == 200) {
        return driverSignupResponseFromJson(response.bodyString.toString());
      } else {
        return driverSignupResponseFromJson(response.bodyString.toString());
      }
    } catch (e) {
      print("Object is $e");
      Get.snackbar("Error", e.toString());
      return null;
    }
  }
}
