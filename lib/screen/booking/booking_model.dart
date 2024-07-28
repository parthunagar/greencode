// To parse this JSON data, do
//
//     final estateNoticeModel = estateNoticeModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final clubListModel = clubListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ClubListModel clubListModelFromJson(String str) => ClubListModel.fromJson(json.decode(str));

String clubListModelToJson(ClubListModel data) => json.encode(data.toJson());

class ClubListModel {
  ClubListModel({
    required this.status,
    required this.message,
    required this.clubData,
  });

  int status;
  String message;
  List<ClubDatum>? clubData;

  factory ClubListModel.fromJson(Map<String, dynamic> json) => ClubListModel(
    status: json["status"],
    message: json["message"],
    // clubData: List<ClubDatum>.from(json["data"].map((x) => ClubDatum.fromJson(x))),
    clubData: json['data'] != null ? List<ClubDatum>.from(json["data"].map((x) => ClubDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(clubData!.map((x) => x.toJson())),
  };
}

class ClubDatum {
  ClubDatum({
    required this.id,
    required this.clubId,
    required this.status,
    required this.clubTitle,
    this.description,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
    required this.count,
    required this.clubImageInfo,
    required this.clubHours,
  });

  int id;
  int clubId;
  int status;
  String clubTitle;
  String? description;
  String languageId;
  dynamic createdAt;
  dynamic updatedAt;
  int count;
  List<ClubImage>? clubImageInfo;
  List<ClubHour>? clubHours;

  factory ClubDatum.fromJson(Map<String, dynamic> json) => ClubDatum(
    id: json["id"],
    clubId: json["club_id"],
    status: json["status"],
    clubTitle: json["club_title"],
    description: json["description"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    count: json["count"],
    clubImageInfo:json['club_image_info'] != null ? List<ClubImage>.from(json["club_image_info"].map((x) => ClubImage.fromJson(x))) : null,
    // clubImage: List<ClubImage>.from(json["club_image"].map((x) => ClubImage.fromJson(x))),
    clubHours: json['club_hours'] != null ? List<ClubHour>.from(json["club_hours"].map((x) => ClubHour.fromJson(x))) : null,
    // clubHours: List<ClubHour>.from(json["club_hours"].map((x) => ClubHour.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "status": status,
    "club_title": clubTitle,
    "description": description,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "count": count,
    "club_image_info": List<dynamic>.from(clubImageInfo!.map((x) => x.toJson())),
    "club_hours": List<dynamic>.from(clubHours!.map((x) => x.toJson())),
  };
}

class ClubHour {
  ClubHour({
    required this.id,
    required this.clubId,
    required this.days,
    required this.charges,
    required this.time,
  });

  int id;
  int clubId;
  String days;
  int charges;
  String time;

  factory ClubHour.fromJson(Map<String, dynamic> json) => ClubHour(
    id: json["id"],
    clubId: json["club_id"],
    days: json["days"],
    charges: json["charges"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "days": days,
    "charges": charges,
    "time": time,
  };
}

class ClubImage {
  ClubImage({
    required this.id,
    required this.clubId,
    required this.clubImage,
  });

  int id;
  int clubId;
  String clubImage;

  factory ClubImage.fromJson(Map<String, dynamic> json) => ClubImage(
    id: json["id"],
    clubId: json["club_id"],
    clubImage: json["club_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "club_image": clubImage,
  };
}

class PayLoad {
  String type;

  PayLoad(this.type);

  factory PayLoad.fromJson(dynamic json) {
    return PayLoad(json['type'] as String);
  }

  @override
  String toString() {
    return '{ ${this.type} }';
  }
}
