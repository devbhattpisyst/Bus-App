import 'dart:convert';

import 'package:bus/controller/passenger_controllers/ComeIn.dart';
import 'package:bus/controller/passenger_controllers/dashboard_controller.dart';
import 'package:bus/models/passenger/all_trips_model.dart';

// import 'package:bus/controller/ComeIn.dart';
import 'package:bus/view/passenger/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Look A Ride"),
        // leading: SizedBox(),
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
              ? SizedBox(
                  height: size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        child: TabBar(
                          controller: controller.tabController,
                          tabs: [
                            GestureDetector(
                              onTap: () async {
                                print("hey");
                                await controller.getBusStopsSortedByDistance();
                              },
                              child: const Tab(
                                text: 'Bus Stops ',
                              ),
                            ),
                            const Tab(text: 'Bus'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          child: TabBarView(
                              controller: controller.tabController,
                              children: [
                                BusStopList(),
                                Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      padding: EdgeInsets.all(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer
                                          .withOpacity(.1),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal:
                                                        size.width * .07),
                                                child: Text(
                                                  "Search",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: size.width * .35,
                                                child: TextFormField(
                                                  // controller: controller.emailEditingController,
                                                  style: TextStyle(
                                                    // color: CustomTheme.white,
                                                    fontSize: size.height * .02,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing:
                                                        size.height * .001,
                                                  ),
                                                  // onChanged: controller.emailChanged,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.height *
                                                                    .01,
                                                            vertical:
                                                                size.height *
                                                                    .01),
                                                    hintText: "terminal 1",
                                                    hintStyle: TextStyle(
                                                        fontSize:
                                                            size.height * .02,
                                                        color: Colors
                                                            .grey.shade500),
                                                    // filled: true,

                                                    // errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.redAccent,
                                                        width:
                                                            size.height * .002,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.redAccent,
                                                        width:
                                                            size.height * .002,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      width: 1,
                                                    )),

                                                    // OutlineInputBorder(

                                                    // borderSide: BorderSide(
                                                    //   color: CustomTheme.inputBorder,
                                                    //   width: size.height * .002,
                                                    // ),
                                                    // ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      width: 1,
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              SizedBox(
                                                width: size.width * .35,
                                                child: TextFormField(
                                                  // controller: controller.emailEditingController,
                                                  style: TextStyle(
                                                    // color: CustomTheme.white,
                                                    fontSize: size.height * .02,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing:
                                                        size.height * .001,
                                                  ),
                                                  // onChanged: controller.emailChanged,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.height *
                                                                    .01,
                                                            vertical:
                                                                size.height *
                                                                    .01),
                                                    hintText: "terminal 2",
                                                    hintStyle: TextStyle(
                                                        fontSize:
                                                            size.height * .02,
                                                        color: Colors
                                                            .grey.shade500),
                                                    // filled: true,

                                                    // errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.redAccent,
                                                        width:
                                                            size.height * .002,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.redAccent,
                                                        width:
                                                            size.height * .002,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      width: 1,
                                                    )),

                                                    // OutlineInputBorder(

                                                    // borderSide: BorderSide(
                                                    //   color: CustomTheme.inputBorder,
                                                    //   width: size.height * .002,
                                                    // ),
                                                    // ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      width: 3,
                                                    )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: controller.trips.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 10,
                                            ),
                                            child: Card(
                                              child: ListTile(
                                                onTap: () {
                                                  // controller.lauchgoogleMaps("18.516726", "73.856255");
                                                  Get.toNamed("/ViewBusDetails",
                                                      arguments: [
                                                        controller.trips[index]
                                                      ]);
                                                },
                                                leading:
                                                    const Icon(Icons.bus_alert),
                                                title: Text(
                                                    "${controller.trips[index].startRoutePoint} -> ${controller.trips[index].endRoutePoint}"),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Row(

                                                    //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    //   children: [
                                                    //     Text(
                                                    //         "bus no: ${controller.trips[index].busNumber}"),
                                                    //     const Spacer(),
                                                    //     Text(
                                                    //         "Route no: ${controller.trips[index].routeID}"),
                                                    //     const Spacer(),
                                                    //   ],
                                                    // ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              "bus no: ${controller.trips[index].busNumber}"),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              "Route no: ${controller.trips[index].routeID}"),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                trailing: Chip(
                                                    label: Text(
                                                        controller.status(
                                                            int.parse(controller
                                                                .trips[index]
                                                                .status)))),
                                                dense: true,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  ListView BusStopList() {
    return ListView.builder(
        itemCount: controller.busStopsSorted.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Card(
              child: ListTile(
                onTap: () async {
                  await controller.getstopsdetails();
                  // var busstop = TripData.fromJson({}).busID;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComeInDashboard()),
                  );
                },
                leading: const Icon(Icons.bus_alert),
                title: Text(controller.busStopsSorted[index].busStopName),
                // subtitle: Text("view location"),
                // dense: true,
                trailing: const Chip(label: Text("view location")),
              ),
            ),
          );
        });
  }
}
