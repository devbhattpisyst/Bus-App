import 'dart:developer';

import 'package:bus/models/driver/driver_login_model.dart';

import 'package:bus/provider/driver_login_provider.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DriverLoginController extends GetxController {
  TextEditingController EmailEditingController = TextEditingController();
  TextEditingController PassEditingController = TextEditingController();

  void onInit() {
    super.onInit();
  }

  var driverTripdetails = <DriverData>[];
  // var data = Get.arguments[0]['data'];

  loginAsDriver() async {
    try {
      await DriverLoginProvider().loginAsDriver({
        "email": EmailEditingController.text,
        "password": PassEditingController.text,
      }).then(
        (loginvalue) async {
          print("The login value  is...." + loginvalue.toString());
          if (loginvalue != null) {
            if (loginvalue.success == true) {
              Get.snackbar("Success", loginvalue.payload.message);
              driverTripdetails = loginvalue.payload.data;
              log("This is our data feild");
              // log("driver Trip details \n" + driverTripdetails.toList().toString());
              Get.offAndToNamed("/DriverDashboard", arguments: [
                {'data': driverTripdetails}
              ]);
            } else {
              Get.snackbar("Error", loginvalue.error.message);
            }
          } else {
            Get.snackbar("Error", "Error occoured");
          }
        },
      );
    } catch (e) {
      print("Exception \n" + e.toString());
    }
  }
}
