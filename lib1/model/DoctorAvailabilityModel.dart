// To parse this JSON data, do
//
//     final doctorAvailabilityModel = doctorAvailabilityModelFromJson(jsonString);

import 'dart:convert';

DoctorAvailabilityModel doctorAvailabilityModelFromJson(String str) =>
    DoctorAvailabilityModel.fromJson(json.decode(str));

String doctorAvailabilityModelToJson(DoctorAvailabilityModel data) =>
    json.encode(data.toJson());

class DoctorAvailabilityModel {
  String? status;
  int? startDate;
  int? endDate;
  String? doctorId;
  List<DateTime>? dates;
  List<AvailabilityDate>? availabilityDates;

  DoctorAvailabilityModel({
    this.status,
    this.startDate,
    this.endDate,
    this.doctorId,
    this.dates,
    this.availabilityDates,
  });

  factory DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      DoctorAvailabilityModel(
        status: json["status"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        doctorId: json["doctorId"],
        dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
        availabilityDates: List<AvailabilityDate>.from(
            json["availabilityDates"].map((x) => AvailabilityDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "startDate": startDate,
        "endDate": endDate,
        "doctorId": doctorId,
        "dates": List<dynamic>.from(dates!.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "availabilityDates":
            List<dynamic>.from(availabilityDates!.map((x) => x.toJson())),
      };
}

class AvailabilityDate {
  DateTime? date;
  List<Slot>? slots;
  LocationDetail? locationDetail;
  DoctorDetail? doctorDetail;

  AvailabilityDate({
    this.date,
    this.slots,
    this.locationDetail,
    this.doctorDetail,
  });

  factory AvailabilityDate.fromJson(Map<String, dynamic> json) =>
      AvailabilityDate(
        date: DateTime.parse(json["date"]),
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        locationDetail: LocationDetail.fromJson(json["locationDetail"]),
        doctorDetail: DoctorDetail.fromJson(json["doctorDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "slots": List<dynamic>.from(slots!.map((x) => x.toJson())),
        "locationDetail": locationDetail!.toJson(),
        "doctorDetail": doctorDetail!.toJson(),
      };
}

class DoctorDetail {
  int? id;
  String? userId;
  dynamic? facebookId;
  dynamic? googleId;
  dynamic? appleId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  bool? emailVarified;
  int? phoneNumber;
  dynamic? phoneVarified;
  String? userPassword;
  dynamic? age;
  dynamic? gender;
  dynamic? otpCode;
  dynamic? otpExpire;
  dynamic? token;
  dynamic? lastLogin;
  dynamic? companyName;
  dynamic? startDate;
  dynamic? endDate;
  dynamic? dateOfBirth;
  dynamic? locationId;
  String? userRole;
  String? userType;
  String? userAvatar;
  String? status;
  String? createdBy;
  dynamic? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  DoctorDetail({
    this.id,
    this.userId,
    this.facebookId,
    this.googleId,
    this.appleId,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.emailVarified,
    this.phoneNumber,
    this.phoneVarified,
    this.userPassword,
    this.age,
    this.gender,
    this.otpCode,
    this.otpExpire,
    this.token,
    this.lastLogin,
    this.companyName,
    this.startDate,
    this.endDate,
    this.dateOfBirth,
    this.locationId,
    this.userRole,
    this.userType,
    this.userAvatar,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DoctorDetail.fromJson(Map<String, dynamic> json) => DoctorDetail(
        id: json["id"],
        userId: json["userId"],
        facebookId: json["facebookId"],
        googleId: json["googleId"],
        appleId: json["appleId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailAddress: json["emailAddress"],
        emailVarified: json["emailVarified"],
        phoneNumber: json["phoneNumber"],
        phoneVarified: json["phoneVarified"],
        userPassword: json["userPassword"],
        age: json["age"],
        gender: json["gender"],
        otpCode: json["otpCode"],
        otpExpire: json["otpExpire"],
        token: json["token"],
        lastLogin: json["lastLogin"],
        companyName: json["companyName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        dateOfBirth: json["dateOfBirth"],
        locationId: json["locationId"],
        userRole: json["userRole"],
        userType: json["userType"],
        userAvatar: json["userAvatar"],
        status: json["status"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "facebookId": facebookId,
        "googleId": googleId,
        "appleId": appleId,
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "emailVarified": emailVarified,
        "phoneNumber": phoneNumber,
        "phoneVarified": phoneVarified,
        "userPassword": userPassword,
        "age": age,
        "gender": gender,
        "otpCode": otpCode,
        "otpExpire": otpExpire,
        "token": token,
        "lastLogin": lastLogin,
        "companyName": companyName,
        "startDate": startDate,
        "endDate": endDate,
        "dateOfBirth": dateOfBirth,
        "locationId": locationId,
        "userRole": userRole,
        "userType": userType,
        "userAvatar": userAvatar,
        "status": status,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class LocationDetail {
  int? id;
  dynamic? userId;
  String? locationName;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? country;
  String? state;
  String? city;
  int? pincode;
  String? googlePlaceId;
  int? lat;
  int? lng;
  String? openTime;
  String? closeTime;
  String? contactNumber;
  String? email;
  String? openDays;
  String? locationImage;
  bool? isAvailable;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  String? status;

  LocationDetail({
    this.id,
    this.userId,
    this.locationName,
    this.addressType,
    this.addressLine1,
    this.addressLine2,
    this.country,
    this.state,
    this.city,
    this.pincode,
    this.googlePlaceId,
    this.lat,
    this.lng,
    this.openTime,
    this.closeTime,
    this.contactNumber,
    this.email,
    this.openDays,
    this.locationImage,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.status,
  });

  factory LocationDetail.fromJson(Map<String, dynamic> json) => LocationDetail(
        id: json["id"],
        userId: json["userId"],
        locationName: json["locationName"],
        addressType: json["addressType"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        googlePlaceId: json["googlePlaceId"],
        lat: json["lat"],
        lng: json["lng"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        openDays: json["openDays"],
        locationImage: json["locationImage"],
        isAvailable: json["isAvailable"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "locationName": locationName,
        "addressType": addressType,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "country": country,
        "state": state,
        "city": city,
        "pincode": pincode,
        "googlePlaceId": googlePlaceId,
        "lat": lat,
        "lng": lng,
        "openTime": openTime,
        "closeTime": closeTime,
        "contactNumber": contactNumber,
        "email": email,
        "openDays": openDays,
        "locationImage": locationImage,
        "isAvailable": isAvailable,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deletedAt": deletedAt,
        "status": status,
      };
}

class Slot {
  String? time;
  bool? isAvail;

  Slot({
    this.time,
    this.isAvail,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        time: json["time"],
        isAvail: json["isAvail"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "isAvail": isAvail,
      };
}
