// To parse this JSON data, do
//
//     final estateNoticeModel = estateNoticeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EstateNoticeModel estateNoticeModelFromJson(String str) => EstateNoticeModel.fromJson(json.decode(str));

String estateNoticeModelToJson(EstateNoticeModel data) => json.encode(data.toJson());

class EstateNoticeModel {
  EstateNoticeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<EstateNoticeData>? data;

  factory EstateNoticeModel.fromJson(Map<String, dynamic> json) => EstateNoticeModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? List<EstateNoticeData>.from(json["data"].map((x) => EstateNoticeData.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EstateNoticeData {
  EstateNoticeData({
    required this.id,
    required this.noticeCategoryId,
    required this.noticeTitle,
    this.description,
    required this.noticeDocumentation,
    required this.status,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
    // required this.noticeCategory,
  });

  int id;
  int noticeCategoryId;
  String noticeTitle;
  String? description;
  String noticeDocumentation;
  int status;
  String languageId;
  DateTime createdAt;
  DateTime updatedAt;
  // NoticeCategory noticeCategory;

  factory EstateNoticeData.fromJson(Map<String, dynamic> json) => EstateNoticeData(
    id: json["id"],
    noticeCategoryId: json["notice_category_id"],
    noticeTitle: json["notice_title"],
    description: json["description"],
    noticeDocumentation: json["notice_documentation"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    // noticeCategory: NoticeCategory.fromJson(json["notice_category_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "notice_category_id": noticeCategoryId,
    "notice_title": noticeTitle,
    "description": description,
    "notice_documentation": noticeDocumentation,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    // "notice_category_info": noticeCategory.toJson(),
  };
}

class NoticeCategory {
  NoticeCategory({
    required this.id,
    required this.noticeCategoryTitle,
    required this.status,
    required this.noticeCatImage,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String noticeCategoryTitle;
  int status;
  dynamic noticeCatImage;
  String languageId;
  DateTime createdAt;
  DateTime updatedAt;

  factory NoticeCategory.fromJson(Map<String, dynamic> json) => NoticeCategory(
    id: json["id"],
    noticeCategoryTitle: json["notice_category_title"],
    status: json["status"],
    noticeCatImage: json["notice_cat_image"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "notice_category_title": noticeCategoryTitle,
    "status": status,
    "notice_cat_image": noticeCatImage,
    "languageId": languageId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
