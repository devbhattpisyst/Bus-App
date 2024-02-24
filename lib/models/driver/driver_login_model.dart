import 'dart:convert';

DriverLoginResponseModel driverLoginResponseModelFromJson(String str) =>
    DriverLoginResponseModel.fromJson(json.decode(str));

String driverLoginResponseModelToJson(DriverLoginResponseModel data) =>
    json.encode(data.toJson());

class DriverLoginResponseModel {
  DriverLoginResponseModel({
    required this.success,
    required this.payload,
    required this.error,
  });

  final bool success;
  final Payload payload;
  final Error error;

  factory DriverLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverLoginResponseModel(
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
  final List<DriverData> data;

  factory Payload.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      return Payload(
        message: json["message"] ?? "",
        data: List<DriverData>.from(
          json["data"].map((x) => DriverData.fromJson(x)),
        ),
      );
    } else {
      return Payload(
        message: json["message"] ?? "",
        data: [],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DriverData {
  DriverData({
    required this.driverID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.password,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.tripId,
    required this.startTime,
    required this.busNumber,
    required this.startRoutePoint,
    required this.endRoutePoint,
    required this.busId,
    required this.tripStatus,
  });

  final String driverID;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String password;
  final String status;
  final String createdDate;
  final String updatedDate;
  final String tripId;
  final String startTime;
  final String busNumber;
  final String startRoutePoint;
  final String endRoutePoint;
  final String busId;
  final String tripStatus;

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
        driverID: json["DriverID"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        email: json["Email"] ?? "",
        mobile: json["Mobile"] ?? "",
        password: json["Password"] ?? "",
        status: json["Status"] ?? "",
        createdDate: json["CreatedDate"] ?? "",
        updatedDate: json["UpdatedDate"] ?? "",
        tripId: json["tripId"] ?? "",
        startTime: json["StartTime"] ?? "",
        busNumber: json["BusNumber"] ?? "",
        startRoutePoint: json["startRoutepoint"] ?? "",
        endRoutePoint: json["endRoutepoint"] ?? "",
        busId: json["busId"] ?? "",
        tripStatus: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "DriverID": driverID,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Mobile": mobile,
        "Password": password,
        "Status": status,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
        "tripId": tripId,
        "StartTime": startTime,
        "BusNumber": busNumber,
        "startRoutepoint": startRoutePoint,
        "endRoutepoint": endRoutePoint,
        "busId": busId,
        "tripStatus": tripStatus,
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
