import 'dart:developer';

import 'package:bus/geo/locator.dart';
import 'package:bus/provider/login_provider.dart';
import 'package:bus/view/passenger/auth/user/signup.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PassengerLoginController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    // Position loc = await determinePosition();
    // log("${loc.latitude} , ${loc.longitude}");
    super.onInit();
  }

  login() async {
    try {
      await PassengerLoginProvider()
          .login({"email": "${emailEditingController.text}", "password": "${passEditingController.text}"}).then(
        (loginvalue) async {
          print(loginvalue);
          if (loginvalue != null) {
            if (loginvalue.success == true) {
              Get.snackbar("Success", loginvalue.payload.message);
              Get.offAndToNamed("/Dashboard");
            } else {
              Get.snackbar("Error", loginvalue.error.message);
            }
          }
        },
      );
    } catch (e) {
      print("Exception \n" + e.toString());
    }
  }
}
