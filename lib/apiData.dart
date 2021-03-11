import 'dart:convert';

class HomePageDart {
  int status;
  String notaryId;
  Notary notary;
  List<Appointments> appointments;

  HomePageDart({this.status, this.notaryId, this.notary, this.appointments});

  HomePageDart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    notaryId = json['notaryId'];
    notary =
    json['notary'] != null ? new Notary.fromJson(json['notary']) : null;
    if (json['appointments'] != null) {
      appointments = new List<Appointments>();
      json['appointments'].forEach((v) {
        appointments.add(new Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['notaryId'] = this.notaryId;
    if (this.notary != null) {
      data['notary'] = this.notary.toJson();
    }
    if (this.appointments != null) {
      data['appointments'] = this.appointments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notary {
  bool isApproved;
  String sId;
  String firstName;
  String lastName;
  String phoneNumber;
  String phoneCountryCode;
  String email;

  Notary(
      {this.isApproved,
        this.sId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.phoneCountryCode,
        this.email});

  Notary.fromJson(Map<String, dynamic> json) {
    isApproved = json['isApproved'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    phoneCountryCode = json['phoneCountryCode'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isApproved'] = this.isApproved;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneCountryCode'] = this.phoneCountryCode;
    data['email'] = this.email;
    return data;
  }
}

class Appointments {
  Appointment appointment;
  String orderId;

  Appointments({this.appointment, this.orderId});

  Appointments.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointment != null) {
      data['appointment'] = this.appointment.toJson();
    }
    data['orderId'] = this.orderId;
    return data;
  }
}

class Appointment {
  bool closed;
  String createdAt;
  String sId;
  String placeId;
  String date;
  String time;
  int escrowNumber;
  String propertyAddress;
  String signerFullName;
  String signerPhoneNumber;
  String place;
  int iV;

  Appointment(
      {this.closed,
        this.createdAt,
        this.sId,
        this.placeId,
        this.date,
        this.time,
        this.escrowNumber,
        this.propertyAddress,
        this.signerFullName,
        this.signerPhoneNumber,
        this.place,
        this.iV});

  Appointment.fromJson(Map<String, dynamic> json) {
    closed = json['closed'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    placeId = json['placeId'];
    date = json['date'];
    time = json['time'];
    escrowNumber = json['escrowNumber'];
    propertyAddress = json['propertyAddress'];
    signerFullName = json['signerFullName'];
    signerPhoneNumber = json['signerPhoneNumber'];
    place = json['place'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['closed'] = this.closed;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['placeId'] = this.placeId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['escrowNumber'] = this.escrowNumber;
    data['propertyAddress'] = this.propertyAddress;
    data['signerFullName'] = this.signerFullName;
    data['signerPhoneNumber'] = this.signerPhoneNumber;
    data['place'] = this.place;
    data['__v'] = this.iV;
    return data;
  }
}
