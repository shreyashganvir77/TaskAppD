// To parse this JSON data, do
//
//     final homePageData = homePageDataFromJson(jsonString);

import 'dart:convert';

HomePageData homePageDataFromJson(String str) => HomePageData.fromJson(json.decode(str));

String homePageDataToJson(HomePageData data) => json.encode(data.toJson());

class HomePageData {
  HomePageData({
    this.status,
    this.notaryId,
    this.notary,
    this.appointments,
  });

  int status;
  String notaryId;
  Notary notary;
  List<AppointmentElement> appointments;

  factory HomePageData.fromJson(Map<String, dynamic> json) => HomePageData(
    status: json["status"],
    notaryId: json["notaryId"],
    notary: Notary.fromJson(json["notary"]),
    appointments: List<AppointmentElement>.from(json["appointments"].map((x) => AppointmentElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "notaryId": notaryId,
    "notary": notary.toJson(),
    "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
  };
}

class AppointmentElement {
  AppointmentElement({
    this.appointment,
    this.orderId,
  });

  AppointmentAppointment appointment;
  String orderId;

  factory AppointmentElement.fromJson(Map<String, dynamic> json) => AppointmentElement(
    appointment: AppointmentAppointment.fromJson(json["appointment"]),
    orderId: json["orderId"],
  );

  Map<String, dynamic> toJson() => {
    "appointment": appointment.toJson(),
    "orderId": orderId,
  };
}

class AppointmentAppointment {
  AppointmentAppointment({
    this.closed,
    this.createdAt,
    this.id,
    this.placeId,
    this.date,
    this.time,
    this.escrowNumber,
    this.propertyAddress,
    this.signerFullName,
    this.signerPhoneNumber,
    this.place,
    this.v,
  });

  bool closed;
  DateTime createdAt;
  String id;
  String placeId;
  String date;
  DateTime time;
  int escrowNumber;
  String propertyAddress;
  String signerFullName;
  String signerPhoneNumber;
  String place;
  int v;

  factory AppointmentAppointment.fromJson(Map<String, dynamic> json) => AppointmentAppointment(
    closed: json["closed"],
    createdAt: DateTime.parse(json["createdAt"]),
    id: json["_id"],
    placeId: json["placeId"],
    date: json["date"],
    time: DateTime.parse(json["time"]),
    escrowNumber: json["escrowNumber"],
    propertyAddress: json["propertyAddress"],
    signerFullName: json["signerFullName"],
    signerPhoneNumber: json["signerPhoneNumber"],
    place: json["place"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "closed": closed,
    "createdAt": createdAt.toIso8601String(),
    "_id": id,
    "placeId": placeId,
    "date": date,
    "time": time.toIso8601String(),
    "escrowNumber": escrowNumber,
    "propertyAddress": propertyAddress,
    "signerFullName": signerFullName,
    "signerPhoneNumber": signerPhoneNumber,
    "place": place,
    "__v": v,
  };
}

class Notary {
  Notary({
    this.isApproved,
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneCountryCode,
    this.email,
  });

  bool isApproved;
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String phoneCountryCode;
  String email;

  factory Notary.fromJson(Map<String, dynamic> json) => Notary(
    isApproved: json["isApproved"],
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    phoneCountryCode: json["phoneCountryCode"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "isApproved": isApproved,
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "phoneCountryCode": phoneCountryCode,
    "email": email,
  };
}
