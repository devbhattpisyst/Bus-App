import 'dart:convert';

SubRoutesResponseModel subRoutesResponseModelFromJson(String str) =>
    SubRoutesResponseModel.fromJson(json.decode(str));

String subRoutesResponseModelToJson(SubRoutesResponseModel data) =>
    json.encode(data.toJson());

class SubRoutesResponseModel {
  SubRoutesResponseModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory SubRoutesResponseModel.fromJson(Map<String, dynamic> json) =>
      SubRoutesResponseModel(
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
  final List<SubRoutes> data;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"],
        data: List<SubRoutes>.from(
            json["data"].map((x) => SubRoutes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SubRoutes {
  SubRoutes({
    required this.id,
    required this.routeId,
    required this.busStopId,
    required this.busStopOrder,
    required this.createdDate,
    required this.updatedDate,
    required this.busStopName,
  });

  final String id;
  final String routeId;
  final String busStopId;
  final String busStopOrder;
  final String createdDate;
  final String updatedDate;
  final String busStopName;

  factory SubRoutes.fromJson(Map<String, dynamic> json) => SubRoutes(
        id: json["ID"] ?? "",
        routeId: json["RouteID"] ?? "",
        busStopId: json["BusStopID"] ?? "",
        busStopOrder: json["BusStopOrder"] ?? "",
        createdDate: json["CreatedDate"] ?? "",
        updatedDate: json["UpdatedDate"] ?? "",
        busStopName: json["BusStopName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "RouteID": routeId,
        "BusStopID": busStopId,
        "BusStopOrder": busStopOrder,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
        "BusStopName": busStopName,
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
