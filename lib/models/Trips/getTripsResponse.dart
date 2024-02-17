// import 'dart:convert';

// class GetTripsResponseModel {
//   bool? success;
//   Payload? payload;
//   Error? error;

//   GetTripsResponseModel({
//     this.success,
//     this.payload,
//     this.error,
//   });

//   factory GetTripsResponseModel.fromRawJson(String str) =>
//       GetTripsResponseModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory GetTripsResponseModel.fromJson(Map<String, dynamic> json) =>
//       GetTripsResponseModel(
//         success: json["success"],
//         payload:
//             json["payload"] == null ? null : Payload.fromJson(json["payload"]),
//         error: json["error"] == null ? null : Error.fromJson(json["error"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "payload": payload?.toJson(),
//         "error": error?.toJson(),
//       };
// }

// class Error {
//   int? code;
//   String? message;

//   Error({
//     this.code,
//     this.message,
//   });

//   factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//         code: json["code"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//       };
// }

// class Payload {
//   String? message;
//   List<Datum>? data;

//   Payload({
//     this.message,
//     this.data,
//   });

//   factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Payload.fromJson(Map<String, dynamic> json) => Payload(
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   String? tripId;
//   String? routeId;
//   String? driverId;
//   String? busId;
//   DateTime? startTime;
//   String? status;
//   String? driverFirstName;
//   String? driverLastName;
//   String? busNumber;
//   String? startRoutepoint;
//   String? endRoutepoint;

//   Datum({
//     this.tripId,
//     this.routeId,
//     this.driverId,
//     this.busId,
//     this.startTime,
//     this.status,
//     this.driverFirstName,
//     this.driverLastName,
//     this.busNumber,
//     this.startRoutepoint,
//     this.endRoutepoint,
//   });

//   factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         tripId: json["TripID"],
//         routeId: json["RouteID"],
//         driverId: json["DriverID"],
//         busId: json["BusID"],
//         startTime: json["StartTime"] == null
//             ? null
//             : DateTime.parse(json["StartTime"]),
//         status: json["Status"],
//         driverFirstName: json["driverFirstName"],
//         driverLastName: json["driverLastName"],
//         busNumber: json["BusNumber"],
//         startRoutepoint: json["startRoutepoint"],
//         endRoutepoint: json["endRoutepoint"],
//       );

//   Map<String, dynamic> toJson() => {
//         "TripID": tripId,
//         "RouteID": routeId,
//         "DriverID": driverId,
//         "BusID": busId,
//         "StartTime": startTime?.toIso8601String(),
//         "Status": status,
//         "driverFirstName": driverFirstName,
//         "driverLastName": driverLastName,
//         "BusNumber": busNumber,
//         "startRoutepoint": startRoutepoint,
//         "endRoutepoint": endRoutepoint,
//       };
// }
// To parse this JSON data, do
// final tripsModel = TripsModel.fromJson(jsonString);

import 'dart:convert';

TripsModel tripsModelFromJson(String str) =>
    TripsModel.fromJson(json.decode(str));

String tripsModelToJson(TripsModel data) => json.encode(data.toJson());

class TripsModel {
  TripsModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory TripsModel.fromJson(Map<String, dynamic> json) => TripsModel(
        success: json["success"],
        payload: Payload.fromJson(json["payload"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "payload": payload.toJson(),
        "error": error.toJson(),
      };
}

class Payload {
  Payload({
    required this.message,
    required this.data,
  });

  final String message;
  final List<Trip> data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"],
        data: List<Trip>.from(json["data"].map((x) => Trip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Trip {
  Trip({
    required this.tripId,
    required this.routeId,
    required this.driverId,
    required this.busId,
    required this.startTime,
    required this.status,
    required this.driverFirstName,
    required this.driverLastName,
    required this.busNumber,
    required this.startRoutepoint,
    required this.endRoutepoint,
  });

  final String tripId;
  final String routeId;
  final String driverId;
  final String busId;
  final String startTime;
  final String status;
  final String driverFirstName;
  final String driverLastName;
  final String busNumber;
  final String startRoutepoint;
  final String endRoutepoint;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        tripId: json["TripID"] ?? "",
        routeId: json["RouteID"] ?? "",
        driverId: json["DriverID"] ?? "",
        busId: json["BusID"] ?? "",
        startTime: json["StartTime"] ?? "",
        status: json["Status"] ?? "",
        driverFirstName: json["driverFirstName"] ?? "",
        driverLastName: json["driverLastName"] ?? "",
        busNumber: json["BusNumber"] ?? "",
        startRoutepoint: json["startRoutepoint"] ?? "",
        endRoutepoint: json["endRoutepoint"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "TripID": tripId,
        "RouteID": routeId,
        "DriverID": driverId,
        "BusID": busId,
        "StartTime": startTime,
        "Status": status,
        "driverFirstName": driverFirstName,
        "driverLastName": driverLastName,
        "BusNumber": busNumber,
        "startRoutepoint": startRoutepoint,
        "endRoutepoint": endRoutepoint,
      };
}

class Error {
  Error({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
