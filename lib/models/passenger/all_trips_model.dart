import 'dart:convert';

// To parse this JSON data, do
// final allTripsResponseModel = AllTripsResponseModel.fromJson(jsonString);

AllTripsResponseModel allTripsResponseModelFromJson(String str) =>
    AllTripsResponseModel.fromJson(json.decode(str));

String allTripsResponseModelToJson(AllTripsResponseModel data) =>
    json.encode(data.toJson());

class AllTripsResponseModel {
  AllTripsResponseModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory AllTripsResponseModel.fromJson(Map<String, dynamic> json) =>
      AllTripsResponseModel(
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
  final List<TripData> data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"],
        data:
            List<TripData>.from(json["data"].map((x) => TripData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TripData {
  TripData({
    required this.tripID,
    required this.routeID,
    required this.driverID,
    required this.busID,
    required this.startTime,
    required this.status,
    required this.createdDateTime,
    required this.updatedDateTime,
    required this.busNumber,
    required this.lastName,
    required this.firstName,
    required this.startRoutePoint,
    required this.endRoutePoint,
  });

  final String tripID;
  final String routeID;
  final String driverID;
  final String busID;
  final String startTime;
  final String status;
  final String createdDateTime;
  final String updatedDateTime;
  final String busNumber;
  final String lastName;
  final String firstName;
  final String startRoutePoint;
  final String endRoutePoint;

  // factory TripData.fromJson(Map<String, dynamic> json) => TripData(
  //       tripID: json["TripID"],
  //       routeID: json["RouteID"],
  //       driverID: json["DriverID"],
  //       busID: json["BusID"],
  //       startTime: json["StartTime"],
  //       status: json["Status"],
  //       createdDateTime: json["CreatedDateTime"],
  //       updatedDateTime: json["UpdatedDateTime"],
  //       busNumber: json["BusNumber"],
  //       lastName: json["LastName"],
  //       firstName: json["FirstName"],
  //       startRoutePoint: json["startRoutepoint"],
  //       endRoutePoint: json["endRoutepoint"],
  //     );
  factory TripData.fromJson(Map<String, dynamic> json) {
    return TripData(
      tripID: json["TripID"] ?? "",
      routeID: json["RouteID"] ?? "",
      driverID: json["DriverID"] ?? "",
      busID: json["BusID"] ?? "",
      startTime: json["StartTime"] ?? "",
      status: json["Status"] ?? "",
      createdDateTime: json["CreatedDateTime"] ?? "",
      updatedDateTime: json["UpdatedDateTime"] ?? "",
      busNumber: json["BusNumber"] ?? "",
      lastName: json["LastName"] ?? "",
      firstName: json["FirstName"] ?? "",
      startRoutePoint: json["startRoutepoint"] ?? "",
      endRoutePoint: json["endRoutepoint"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "TripID": tripID,
        "RouteID": routeID,
        "DriverID": driverID,
        "BusID": busID,
        "StartTime": startTime,
        "Status": status,
        "CreatedDateTime": createdDateTime,
        "UpdatedDateTime": updatedDateTime,
        "BusNumber": busNumber,
        "LastName": lastName,
        "FirstName": firstName,
        "startRoutepoint": startRoutePoint,
        "endRoutepoint": endRoutePoint,
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
