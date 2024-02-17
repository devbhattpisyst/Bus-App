import 'dart:convert';

import 'package:bus/models/passenger/all_bus_stops_model.dart';
import 'package:bus/models/passenger/passenger_login_model.dart';
import 'package:bus/models/passenger/passenger_signup_model.dart';
import 'package:bus/utils/constants.dart';
import 'package:get/get.dart';

class PassengerSignupProvider extends GetConnect {
  Future<SignUpResponseModel?> signup(jsonArray) async {
    try {
      print(jsonArray);

      Response response =
          await post("${Constants.baseUrl}Bus/registrationUser", jsonEncode(jsonArray), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      final body = json.decode(json.encode(response.body));

      print("body \n" + body.toString());
      if (response.statusCode == 200) {
        return signUpResponseModelFromJson(response.bodyString.toString());
      } else {
        return signUpResponseModelFromJson(response.bodyString.toString());
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
