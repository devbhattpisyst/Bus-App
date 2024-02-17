import 'dart:convert';

// To parse this JSON data, do
// final driverTripDetailsList = List<DriverTripDetails>.from(jsonString.map((x) => DriverTripDetails.fromJson(x)));

class DriverTripDetails {
  DriverTripDetails({
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
    required this.busNumber,
    required this.startRoutePoint,
    required this.endRoutePoint,
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
  final String busNumber;
  final String startRoutePoint;
  final String endRoutePoint;

  factory DriverTripDetails.fromJson(Map<String, dynamic> json) => DriverTripDetails(
        driverID: json["DriverID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        mobile: json["Mobile"],
        password: json["Password"],
        status: json["Status"],
        createdDate: json["CreatedDate"],
        updatedDate: json["UpdatedDate"],
        tripId: json["tripId"],
        busNumber: json["BusNumber"],
        startRoutePoint: json["startRoutepoint"],
        endRoutePoint: json["endRoutepoint"],
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
        "BusNumber": busNumber,
        "startRoutepoint": startRoutePoint,
        "endRoutepoint": endRoutePoint,
      };
}
