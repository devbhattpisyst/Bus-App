import 'package:bus/provider/signup_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PassengerSignupController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  TextEditingController firstnameEditingController = TextEditingController();
  TextEditingController middlenameEditingController = TextEditingController();
  TextEditingController lastnameEditingController = TextEditingController();

  signUp() async {
    try {
      await PassengerSignupProvider().signup({
        "firstname": firstnameEditingController.text,
        "middlename": middlenameEditingController.text,
        "lastname": lastnameEditingController.text,
        "password": passEditingController.text,
        "email": emailEditingController.text
      }).then(
        (signupvalue) async {
          print(signupvalue);
          if (signupvalue != null) {
            if (signupvalue.success == true) {
              Get.snackbar("Success", signupvalue.payload.message);
              Get.back();
            } else {
              Get.snackbar("Error", signupvalue.error.message);
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
