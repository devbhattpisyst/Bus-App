import 'dart:convert';

// To parse this JSON data, do
// final busStopsModel = BusStopsModel.fromJson(jsonString);

BusStopsModel busStopsModelFromJson(String str) => BusStopsModel.fromJson(json.decode(str));

String busStopsModelToJson(BusStopsModel data) => json.encode(data.toJson());

class BusStopsModel {
  BusStopsModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory BusStopsModel.fromJson(Map<String, dynamic> json) => BusStopsModel(
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
  final List<BusStop> data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"],
        data: List<BusStop>.from(json["data"].map((x) => BusStop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BusStop {
  BusStop({
    required this.busStopID,
    required this.busStopName,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
  });

  final String busStopID;
  final String busStopName;
  final String latitude;
  final String longitude;
  final String status;
  final String createdDate;
  final String updatedDate;

  factory BusStop.fromJson(Map<String, dynamic> json) => BusStop(
        busStopID: json["BusStopID"],
        busStopName: json["BusStopName"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        status: json["Status"],
        createdDate: json["CreatedDate"],
        updatedDate: json["UpdatedDate"],
      );

  Map<String, dynamic> toJson() => {
        "BusStopID": busStopID,
        "BusStopName": busStopName,
        "Latitude": latitude,
        "Longitude": longitude,
        "Status": status,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
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
