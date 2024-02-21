// first create

import 'dart:developer';

import 'package:bus/provider/driver_signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverSignUpController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController firstnameEditingController = TextEditingController();
  TextEditingController middlenameEditingController = TextEditingController();
  TextEditingController lastnameEditingController = TextEditingController();

  SignUp() async {
    try {
      await DriverSignupProvider().Sign_Up({
        "firstname": firstnameEditingController.text,
        "middlename": middlenameEditingController.text,
        "lastname": lastnameEditingController.text,
        "password": passwordEditingController.text,
        "email": emailEditingController.text
      }).then((signupentity) async {
        log("This is sign up entity of driver log in.${signupentity}");
        if (signupentity != null) {
          if (signupentity.success == true) {
            Get.snackbar("Success", signupentity.payload.message);
            Get.back();
          } else {
            Get.snackbar("Error", signupentity.error.message);
          }
        } else {
          Get.snackbar("Error", "Error Occured");
        }
      });
    } catch (e) {
      print("Exception \n" + e.toString());
    }
  }
}
