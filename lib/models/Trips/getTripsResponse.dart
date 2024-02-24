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
