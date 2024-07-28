import 'package:get/get.dart';

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final estateInfoModel = estateInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EstateInfoModel estateInfoModelFromJson(String str) => EstateInfoModel.fromJson(json.decode(str));

String estateInfoModelToJson(EstateInfoModel data) => json.encode(data.toJson());

class EstateInfoModel {
  EstateInfoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<EstateInfoData>? data;

  factory EstateInfoModel.fromJson(Map<String, dynamic> json) => EstateInfoModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? List<EstateInfoData>.from(json["data"].map((x) => EstateInfoData.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EstateInfoData {
  EstateInfoData({
    required this.id,
    required this.noticeTitle,
    required this.noticeCount,
    required this.noticeCatImage,
    required this.noticeCategoriesId,
  });

  int id;
  String noticeTitle;
  int noticeCount;
  String noticeCatImage;
  int noticeCategoriesId;

  factory EstateInfoData.fromJson(Map<String, dynamic> json) => EstateInfoData(
    id: json["id"],
    noticeTitle: json["notice_category_title"],
    noticeCount: json["noticeCount"],
    noticeCatImage: json["notice_cat_image"] == null ? ' ' :  json["notice_cat_image"],
    noticeCategoriesId: json["notice_categories_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "notice_category_title": noticeTitle,
    "noticeCount": noticeCount,
    "notice_cat_image": noticeCatImage,
    "notice_categories_id": noticeCategoriesId,
  };
}
