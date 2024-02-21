import 'dart:convert';

DriverSignupResponseModel driverSignupResponseFromJson(String str) =>
    DriverSignupResponseModel.fromJson(json.decode(str));

String driverSignupResponseToJson(DriverSignupResponseModel data) =>
    json.encode(data.toJson());

class DriverSignupResponseModel {
  DriverSignupResponseModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory DriverSignupResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverSignupResponseModel(
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
  });

  final String message;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "message": message,
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
