import 'package:bus/controller/passenger_controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ComeInDashboard extends GetView<DashboardController> {
  const ComeInDashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Bus Stops Details"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Get.offAndToNamed("/login");
              },
              child: const Text(
                "Logout",
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: controller.loading.value == false
              ? ListView.builder(
                  itemCount: controller.busstoparray.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          leading: Icon(Icons.bus_alert),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From : ${controller.busstoparray[index].startRoutepoint} To : ${controller.busstoparray[index].endRoutepoint}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${controller.busstoparray[index].startTime}',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              Text(
                                '${controller.busstoparray[index].driverFirstName} -> ${controller.busstoparray[index].driverLastName}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            'Bus Number: ${controller.busstoparray[index].busNumber}',
                            style: TextStyle(fontSize: 19),
                          ),
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://www.google.com/maps/search/?api=1&query=${controller.latitude},${controller.longitude}'));
                          },
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
