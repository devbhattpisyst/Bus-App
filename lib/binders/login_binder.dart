import 'package:bus/controller/passenger_controllers/login_controller.dart';
import 'package:get/get.dart';

class PassengerLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassengerLoginController>(() => PassengerLoginController(),
        fenix: true);
  }
}
