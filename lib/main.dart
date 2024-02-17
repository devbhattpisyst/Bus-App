import 'package:bus/binders/login_binder.dart';
import 'package:bus/view/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      getPages: routes,
      // intial binding code keh data ko bind kr dehta hai before loading an application.
      // which increases the application performance as well as the user experience.
      initialBinding: PassengerLoginBinding(),
    );
  }
}
