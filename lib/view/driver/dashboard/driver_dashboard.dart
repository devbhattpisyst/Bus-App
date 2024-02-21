import 'package:bus/controller/driver_controllers/driver_dash_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DriverDashboard extends GetView<DriverDashController> {
  const DriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isNoTripAssigned = controller.driverTripdetails.isEmpty;

    if (isNoTripAssigned == true) {
      // Schedule the navigation to happen after the build process is complete
      // Future.delayed(Duration.zero, () {
      //   Get.to(NoTripsAssignedPage());
      // });
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text(
            "Drive a Bus",
          ),
        ),
        body: Center(
          child: Text('No Trips assigned yet'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "Drive a Bus",
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
                height: size.height * .3,
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
                              "Todays Assigned Bus",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.bus_alert,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Bus no : ${controller.driverTripdetails[controller.currentTripindex].busNumber}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                "Trip no : ${controller.driverTripdetails[controller.currentTripindex].tripId}",
                                style: Theme.of(context).textTheme.titleSmall,
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
                                "${controller.driverTripdetails[controller.currentTripindex].startRoutePoint}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Icon(Icons.arrow_right_alt_outlined),
                              Text(
                                "${controller.driverTripdetails[controller.currentTripindex].endRoutePoint}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${DateFormat("hh:mm a").format(DateTime.parse(controller.driverTripdetails[controller.currentTripindex].startTime))}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * .07,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.startTrip();
                            },
                            child: Text(
                              "Start",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * .07,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.reachedTrip();
                            },
                            child: Text(
                              "Reached",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * .07,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.sos(context);
                            },
                            child: Text(
                              "SOS",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  bottomSheet(context) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.sizeOf(context);
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: size.height * .3,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: size.width * .3,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Text(
                      'Please Describe Your Problem',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        maxLines: 3,
                        controller: controller.descController,
                        style: TextStyle(
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.w500,
                          letterSpacing: size.height * .001,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: size.height * .01,
                              vertical: size.height * .01),
                          hintStyle: TextStyle(
                              fontSize: size.height * .02,
                              color: Colors.grey.shade500),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: size.height * .002,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: size.height * .002,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text('Cancle'),
                          onPressed: () {
                            Navigator.pop(context);
                            controller.descController.clear();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Send'),
                          onPressed: () => controller.sendSOS(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
// }
