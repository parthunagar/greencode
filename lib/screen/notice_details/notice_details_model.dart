import 'package:get/get.dart';

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SignOutModel {
  SignOutModel({
    required this.message,
    required this.status,
  });

  String message;
  int status;

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}



AdvertisementModel advertisementModelFromJson(String str) => AdvertisementModel.fromJson(json.decode(str));

String advertisementModelToJson(AdvertisementModel data) => json.encode(data.toJson());

class AdvertisementModel {
  AdvertisementModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<AdvertiseData>? data;

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? List<AdvertiseData>.from(json["data"].map((x) => AdvertiseData.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AdvertiseData {
  AdvertiseData({
    required this.id,
    required this.advertiseTitle,
    required this.advertiseLink,
    required this.description,
    required this.advertiseImage,
    required this.status,
    required this.languageId,
    required this.mobileNo,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String advertiseTitle;
  String advertiseLink;
  String description;
  String advertiseImage;
  int status;
  int languageId;
  dynamic mobileNo;
  DateTime createdAt;
  DateTime updatedAt;

  factory AdvertiseData.fromJson(Map<String, dynamic> json) => AdvertiseData(
    id: json["id"],
    advertiseTitle: json["advertise_title"],
    advertiseLink: json["advertise_link"],
    description: json["description"],
    advertiseImage: json["advertise_image"],
    status: json["status"],
    languageId: json["languageId"],
    mobileNo: json["mobile_no"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertise_title": advertiseTitle,
    "advertise_link": advertiseLink,
    "description": description,
    "advertise_image": advertiseImage,
    "status": status,
    "languageId": languageId,
    "mobile_no": mobileNo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

