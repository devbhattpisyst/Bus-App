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
  TextEditingController phoneNumberEditingController = TextEditingController();
  SignUp() async {
    try {
      await DriverSignupProvider().signUp({
        "firstname": firstnameEditingController.text,
        "middlename": middlenameEditingController.text,
        "lastname": lastnameEditingController.text,
        "password": passwordEditingController.text,
        "email": emailEditingController.text,
        "mobile": phoneNumberEditingController.text,
      }).then((signupentity) async {
        log("This is sign up entity of driver log in.$signupentity");
        // log(firstnameEditingController.text);
        // log(middlenameEditingController.text);
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
      print("Exception \n$e");
    }
  }
}
