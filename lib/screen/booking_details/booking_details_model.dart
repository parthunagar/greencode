// To parse this JSON data, do
//
//     final estateNoticeModel = estateNoticeModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final clubListModel = clubListModelFromJson(jsonString);

import 'dart:ffi';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Name {
  String? day;
  List? timePeriod;
  List? charges;

  Name({this.day,this.timePeriod, this.charges});
}

class TimeModel {
  RxBool? selected = false.obs;
  RxString? title;
  RxInt maintanance = 0.obs;
  TimeModel({this.selected, this.title,required this.maintanance});
}


ClubDetailsModel clubDetailsModelFromJson(String str) => ClubDetailsModel.fromJson(json.decode(str));

String clubDetailsModelToJson(ClubDetailsModel data) => json.encode(data.toJson());

class ClubDetailsModel {
  ClubDetailsModel({
    this.status,
    this.message,
    this.clubData,
  });

  int? status;
  String? message;
  List<ClubDatum>? clubData;

  factory ClubDetailsModel.fromJson(Map<String, dynamic> json) => ClubDetailsModel(
    status: json["status"],
    message: json["message"],
    clubData:json['data'] != null ? List<ClubDatum>.from(json["data"].map((x) => ClubDatum.fromJson(x))) : null,
    // clubData: List<ClubDatum>.from(json["data"].map((x) => ClubDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(clubData!.map((x) => x.toJson())),
  };
}

class ClubDatum {
  ClubDatum({
    this.id,
    this.status,
    this.clubTitle,
    this.description,
    required this.sectionTime,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.clubHours,
    this.clubImageInfo,
  });

  int? id,status;
  String? clubTitle,description,languageId;
  int sectionTime;
  dynamic createdAt,updatedAt;
  List<ClubHour>? clubHours;
  List<ClubImage>? clubImageInfo;

  factory ClubDatum.fromJson(Map<String, dynamic> json) => ClubDatum(
    id: json["id"],
    status: json["status"],
    clubTitle: json["club_title"],
    description: json["description"],
    sectionTime: json["section_time"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    // clubHours: List<ClubHour>.from(json["club_hours"].map((x) => ClubHour.fromJson(x))),
    clubHours: json['club_hours'] != null ? List<ClubHour>.from(json["club_hours"].map((x) => ClubHour.fromJson(x))) : null,
    // clubImage: List<ClubImage>.from(json["club_image"].map((x) => ClubImage.fromJson(x))),
    clubImageInfo: json['club_image_info'] != null ? List<ClubImage>.from(json["club_image_info"].map((x) => ClubImage.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "club_title": clubTitle,
    "description": description,
    "section_time": sectionTime,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "club_hours": List<dynamic>.from(clubHours!.map((x) => x.toJson())),
    "club_image_info": List<dynamic>.from(clubImageInfo!.map((x) => x.toJson())),
  };
}

class ClubHour {
  ClubHour({
    this.days,
    this.charge,
    this.time,
    this.maintenance,
  });

  List<String>? days;
  List<dynamic>? charge;
  List<String>? time;
  List<Maintenance>? maintenance;

  factory ClubHour.fromJson(Map<String, dynamic> json) => ClubHour(
    // days: List<String>.from(json["days"].map((x) => x)),
    days: json['days'] != null ? List<String>.from(json["days"].map((x) => x)) : null,
    // charge: List<int>.from(json["charge"].map((x) => x)),
    charge: json['charge'] != null ? List<dynamic>.from(json["charge"].map((x) => x)) : null,
    // time: List<String>.from(json["time"].map((x) => x)),
    time: json['time'] != null ? List<String>.from(json["time"].map((x) => x)) : null,
    maintenance:json['maintenance'] != null ? List<Maintenance>.from(json["maintenance"].map((x) => Maintenance.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "days": List<dynamic>.from(days!.map((x) => x)),
    "charge": List<dynamic>.from(charge!.map((x) => x)),
    "time": List<dynamic>.from(time!.map((x) => x)),
    "maintenance": List<dynamic>.from(maintenance!.map((x) => x.toJson())),
  };
}

class Maintenance {
  Maintenance({
    this.days,
    this.time,
    this.maintenance,
  });

  String? days;
  String? time;
  int? maintenance;

  factory Maintenance.fromJson(Map<String, dynamic> json) => Maintenance(
    days: json["days"],
    time: json["time"],
    maintenance: json["maintenance"],
  );

  Map<String, dynamic> toJson() => {
    "days": days,
    "time": time,
    "maintenance": maintenance,
  };
}

class ClubImage {
  ClubImage({
    this.id,
    this.clubId,
    this.clubImage,
    this.createdAt,
    this.updatedAt,
  });

  int? id,clubId;
  String? clubImage;
  DateTime? createdAt,updatedAt;

  factory ClubImage.fromJson(Map<String, dynamic> json) => ClubImage(
    id: json["id"],
    clubId: json["club_id"],
    clubImage: json["club_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "club_image": clubImage,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

ClubBookingModel clubBookingModelFromJson(String str) => ClubBookingModel.fromJson(json.decode(str));

String clubBookingModelToJson(ClubBookingModel data) => json.encode(data.toJson());

class ClubBookingModel {
  ClubBookingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory ClubBookingModel.fromJson(Map<String, dynamic> json) => ClubBookingModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? Data.fromJson(json["data"]): null,
    // data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class MainClass{
  final List<String> day;
  final List<String> timeList;
  final List<String> priceList;


  MainClass({required this.day,required this.priceList, required this.timeList});
}


class Data {
  Data({
    required this.clubId,
    required this.userId,
    required this.date,
    required this.paymentDate,
    required this.time,
    required this.adult,
    required this.child,
    required this.baby,
    required this.status,
    required this.languageId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int clubId;
  int userId;
  DateTime date;
  DateTime paymentDate;
  String time;
  String adult;
  String child;
  String baby;
  String status;
  String languageId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    clubId: json["club_id"],
    userId: json["user_id"],
    date: DateTime.parse(json["date"]),
    paymentDate: DateTime.parse(json["payment_date"]),
    time: json["time"],
    adult: json["adult"],
    child: json["child"],
    baby: json["baby"],
    status: json["status"],
    languageId: json["languageId"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "club_id": clubId,
    "user_id": userId,
    "date": date,
    "payment_date": paymentDate,
    "time": time,
    "adult": adult,
    "child": child,
    "baby": baby,
    "status": status,
    "languageId": languageId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

