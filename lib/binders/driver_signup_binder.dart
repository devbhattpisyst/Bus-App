import 'package:bus/controller/driver_controllers/driver_signup_controller.dart';
import 'package:get/get.dart';

class DriverSignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverSignUpController>(() => DriverSignUpController(),
        fenix: true);
  }
}
