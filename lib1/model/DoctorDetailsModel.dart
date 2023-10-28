// To parse this JSON data, do
//
//     final doctorDetailsModel = doctorDetailsModelFromJson(jsonString);

import 'dart:convert';

DoctorDetailsModel doctorDetailsModelFromJson(String str) =>
    DoctorDetailsModel.fromJson(json.decode(str));

String doctorDetailsModelToJson(DoctorDetailsModel data) =>
    json.encode(data.toJson());

class DoctorDetailsModel {
  String? status;
  String? message;
  Data? data;

  DoctorDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) =>
      DoctorDetailsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  int? id;
  String? userId;
  dynamic? locationId;
  dynamic? companyName;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userType;
  String? userRole;
  int? phoneNumber;
  String? status;
  String? userAvatar;
  dynamic? locationDetail;
  DoctorProfiles? doctorProfiles;
  dynamic? like;
  Favorite? favorite;
  int? isLike;
  int? isFavorite;

  Data({
    this.id,
    this.userId,
    this.locationId,
    this.companyName,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userType,
    this.userRole,
    this.phoneNumber,
    this.status,
    this.userAvatar,
    this.locationDetail,
    this.doctorProfiles,
    this.like,
    this.favorite,
    this.isLike,
    this.isFavorite,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["userId"],
        locationId: json["locationId"],
        companyName: json["companyName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailAddress: json["emailAddress"],
        userType: json["userType"],
        userRole: json["userRole"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        userAvatar: json["userAvatar"],
        locationDetail: json["locationDetail"],
        doctorProfiles: DoctorProfiles.fromJson(json["doctorProfiles"]),
        like: json["like"],
        favorite: Favorite.fromJson(json["favorite"]),
        isLike: json["isLike"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "locationId": locationId,
        "companyName": companyName,
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "userType": userType,
        "userRole": userRole,
        "phoneNumber": phoneNumber,
        "status": status,
        "userAvatar": userAvatar,
        "locationDetail": locationDetail,
        "doctorProfiles": doctorProfiles!.toJson(),
        "like": like,
        "favorite": favorite!.toJson(),
        "isLike": isLike,
        "isFavorite": isFavorite,
      };
}

class DoctorProfiles {
  int? id;
  int? userId;
  dynamic? locationId;
  String? professionalBio;
  String? specialty;
  String? consultingLanguages;
  String? experienceInIndustry;
  String? awardsAndPublications;
  String? workingTime;
  dynamic? startDate;
  dynamic? endDate;
  dynamic? note;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  dynamic? deletedAt;
  List<Qualification>? qualifications;

  DoctorProfiles({
    this.id,
    this.userId,
    this.locationId,
    this.professionalBio,
    this.specialty,
    this.consultingLanguages,
    this.experienceInIndustry,
    this.awardsAndPublications,
    this.workingTime,
    this.startDate,
    this.endDate,
    this.note,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.deletedAt,
    this.qualifications,
  });

  factory DoctorProfiles.fromJson(Map<String, dynamic> json) => DoctorProfiles(
        id: json["id"],
        userId: json["userId"],
        locationId: json["locationId"],
        professionalBio: json["professionalBio"],
        specialty: json["specialty"],
        consultingLanguages: json["consultingLanguages"],
        experienceInIndustry: json["experienceInIndustry"],
        awardsAndPublications: json["awardsAndPublications"],
        workingTime: json["workingTime"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        note: json["note"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        deletedAt: json["deletedAt"],
        qualifications: List<Qualification>.from(
            json["qualifications"].map((x) => Qualification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "locationId": locationId,
        "professionalBio": professionalBio,
        "specialty": specialty,
        "consultingLanguages": consultingLanguages,
        "experienceInIndustry": experienceInIndustry,
        "awardsAndPublications": awardsAndPublications,
        "workingTime": workingTime,
        "startDate": startDate,
        "endDate": endDate,
        "note": note,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "deletedAt": deletedAt,
        "qualifications":
            List<dynamic>.from(qualifications!.map((x) => x.toJson())),
      };
}

class Qualification {
  int? id;
  int? doctorProfileId;
  String? qualificationName;
  DateTime? startDate;
  DateTime? endDate;
  dynamic? note;
  dynamic? createdBy;
  dynamic? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  dynamic? deletedAt;

  Qualification({
    this.id,
    this.doctorProfileId,
    this.qualificationName,
    this.startDate,
    this.endDate,
    this.note,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.deletedAt,
  });

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        id: json["id"],
        doctorProfileId: json["doctorProfileId"],
        qualificationName: json["qualificationName"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        note: json["note"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorProfileId": doctorProfileId,
        "qualificationName": qualificationName,
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
        "note": note,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "deletedAt": deletedAt,
      };
}

class Favorite {
  int? id;

  Favorite({
    this.id,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
