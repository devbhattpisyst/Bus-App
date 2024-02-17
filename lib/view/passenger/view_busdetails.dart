import 'package:bus/controller/driver_controllers/driver_dash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewBusDetails extends GetView<DriverDashController> {
  const ViewBusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "Look at a Bus",
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * .33,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.bus_alert,
                            ),
                            Text(
                              "Bus Details",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Icon(
                              Icons.bus_alert,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Bus no : ${Get.arguments?[0]?.busNumber ?? ""}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "Route no : ${Get.arguments?[0]?.routeID ?? ""}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${Get.arguments[0].startRoutePoint}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Icon(Icons.arrow_right_alt_outlined),
                              Text(
                                "${Get.arguments[0].endRoutePoint}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${DateFormat("hh:mm a").format(DateTime.parse(Get.arguments[0].startTime))}",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 0,
                        ),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              controller.lauchgoogleMaps(
                                  "18.516726", "73.856255");
                            },
                            leading: const Icon(Icons.paragliding_outlined),
                            title: const Text("Gadital bus stop"),
                            // subtitle: Text("view location"),
                            // dense: true,
                            trailing: const Chip(label: Text("view location")),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
