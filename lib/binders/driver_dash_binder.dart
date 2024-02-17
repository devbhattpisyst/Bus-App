import 'package:bus/controller/driver_controllers/driver_dash_controller.dart';
import 'package:bus/controller/passenger_controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DriverDashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverDashController>(() => DriverDashController(), fenix: true);
  }
}
