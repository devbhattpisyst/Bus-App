import 'package:bus/controller/driver_controllers/driver_login_controller.dart';
import 'package:get/get.dart';

class DriverLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverLoginController>(() => DriverLoginController(), fenix: true);
  }
}
