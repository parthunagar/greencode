// To parse this JSON data, do
//
//     final estateNoticeModel = estateNoticeModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final clubListModel = clubListModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final essentialListModel = essentialListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EssentialListModel essentialListModelFromJson(String str) => EssentialListModel.fromJson(json.decode(str));

String essentialListModelToJson(EssentialListModel data) => json.encode(data.toJson());

class EssentialListModel {
  EssentialListModel({
    required this.status,
    required this.message,
    required this.essentialData,
  });

  int status;
  String message;
  List<EssentialDatum>? essentialData;

  factory EssentialListModel.fromJson(Map<String, dynamic> json) => EssentialListModel(
    status: json["status"],
    message: json["message"],
    essentialData: json['data'] != null ? List<EssentialDatum>.from(json["data"].map((x) => EssentialDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(essentialData!.map((x) => x.toJson())),
  };
}

class EssentialDatum {
  EssentialDatum({
    required this.id,
    required this.cmsCategoryTitle,
    required this.cmsCategoryImage,
    required this.status,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String cmsCategoryTitle;
  String cmsCategoryImage;
  int status;
  String languageId;
  dynamic createdAt;
  dynamic updatedAt;

  factory EssentialDatum.fromJson(Map<String, dynamic> json) => EssentialDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
