// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String? status;
  String? message;
  int? total;
  List<Datum>? data;

  NotificationModel({
    this.status,
    this.message,
    this.total,
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        message: json["message"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total": total,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? path;
  String? title;
  String? subTitle;
  bool? readStatus;
  int? userId;
  dynamic? all;
  dynamic? admin;
  dynamic? image;
  dynamic? note;
  DateTime? createdAt;
  String? status;

  Datum({
    this.id,
    this.path,
    this.title,
    this.subTitle,
    this.readStatus,
    this.userId,
    this.all,
    this.admin,
    this.image,
    this.note,
    this.createdAt,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        path: json["path"],
        title: json["title"],
        subTitle: json["subTitle"],
        readStatus: json["readStatus"],
        userId: json["userId"],
        all: json["all"],
        admin: json["admin"],
        image: json["image"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "title": title,
        "subTitle": subTitle,
        "readStatus": readStatus,
        "userId": userId,
        "all": all,
        "admin": admin,
        "image": image,
        "note": note,
        "createdAt": createdAt!.toIso8601String(),
        "status": status,
      };
}
