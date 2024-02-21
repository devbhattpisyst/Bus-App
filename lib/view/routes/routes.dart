import 'package:bus/binders/dashboard_binder.dart';
import 'package:bus/binders/driver_dash_binder.dart';
import 'package:bus/binders/driver_login_binder.dart';
import 'package:bus/binders/driver_signup_binder.dart';
import 'package:bus/binders/login_binder.dart';
import 'package:bus/binders/signup_binder.dart';
import 'package:bus/view/driver/auth/DriverSignup.dart';
import 'package:bus/view/driver/auth/driver_login.dart';
import 'package:bus/view/driver/dashboard/driver_dashboard.dart';
import 'package:bus/view/passenger/auth/user/login.dart';
import 'package:bus/view/passenger/auth/user/signup.dart';
import 'package:bus/view/passenger/dashboard.dart';
import 'package:bus/view/passenger/view_busdetails.dart';
import 'package:get/get.dart';

var routes = [
  GetPage(
    name: "/login",
    page: () => Login(),
    binding: PassengerLoginBinding(),
  ),
  GetPage(
    name: "/Dashboard",
    page: () => Dashboard(),
    binding: DashboardBinding(),
  ),
  GetPage(
    name: "/SignUp",
    page: () => SignUp(),
    binding: PassengerSignupBinding(),
  ),
  GetPage(
    name: "/DriverSignUp",
    page: () => DriverSignUp(),
    binding: DriverSignUpBinding(),
  ),
  GetPage(
    name: "/DriverLogin",
    page: () => DriverLogin(),
    binding: DriverLoginBinding(),
  ),
  GetPage(
    name: "/DriverDashboard",
    page: () => DriverDashboard(),
    binding: DriverDashBinding(),
  ),
  GetPage(
    name: "/ViewBusDetails",
    page: () => ViewBusDetails(),
    binding: DriverDashBinding(),
  ),
];
