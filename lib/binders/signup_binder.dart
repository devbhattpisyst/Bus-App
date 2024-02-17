import 'package:bus/controller/passenger_controllers/signup_controller.dart';
import 'package:get/get.dart';

class PassengerSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassengerSignupController>(() => PassengerSignupController(),
        fenix: true);
  }
}
