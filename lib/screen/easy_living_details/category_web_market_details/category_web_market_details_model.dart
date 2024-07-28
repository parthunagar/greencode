// To parse this JSON data, do
//
//     final wetMarketModel = wetMarketModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WetMarketModel wetMarketModelFromJson(String str) => WetMarketModel.fromJson(json.decode(str));

String wetMarketModelToJson(WetMarketModel data) => json.encode(data.toJson());

class WetMarketModel {
  WetMarketModel({
     this.status,
     this.message,
     this.wetMarketData,
  });

  int? status;
  String? message;
  List<WetMarketDatum>? wetMarketData;

  factory WetMarketModel.fromJson(Map<String, dynamic> json) => WetMarketModel(
    status: json["status"],
    message: json["message"],
    wetMarketData:  json['data'] != null ? List<WetMarketDatum>.from(json["data"].map((x) => WetMarketDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(wetMarketData!.map((x) => x.toJson())),
  };
}

class WetMarketDatum {
  WetMarketDatum({
     this.id,
     this.cmsCategoryTitle,
     this.cmsCategoryImage,
     this.status,
     this.languageId,
     this.createdAt,
     this.updatedAt,
     this.stationList,
  });

  int? id;
  String? cmsCategoryTitle;
  String? cmsCategoryImage;
  int? status;
  String? languageId;
  dynamic createdAt;
  dynamic updatedAt;
  List<StationList>? stationList;

  factory WetMarketDatum.fromJson(Map<String, dynamic> json) => WetMarketDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    stationList:  json['station_list'] != null ? List<StationList>.from(json["station_list"].map((x) => StationList.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "station_list": List<dynamic>.from(stationList!.map((x) => x.toJson())),
  };
}

class StationList {
  StationList({
     this.id,
     this.cmsId,
     this.stationName,
     this.stationImage,
     this.languageId,
     this.createdAt,
     this.updatedAt,
     this.categoryDetails,
  });

  int? id;
  int? cmsId;
  String? stationName;
  String? stationImage;
  String? languageId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CategoryDetail>? categoryDetails;

  factory StationList.fromJson(Map<String, dynamic> json) => StationList(
    id: json["id"],
    cmsId: json["cms_id"],
    stationName: json["station_name"],
    stationImage: json["station_image"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryDetails:  json['category_details'] != null ? List<CategoryDetail>.from(json["category_details"].map((x) => CategoryDetail.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_name": stationName,
    "station_image": stationImage,
    "languageId": languageId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "category_details": List<dynamic>.from(categoryDetails!.map((x) => x.toJson())),
  };
}

class CategoryDetail {
  CategoryDetail({
     this.id,
     this.cmsId,
     this.stationId,
     this.title,
     this.description,
     this.time,
     this.charges,
     this.webLink,
     this.locationLink,
     this.callUs,
     this.languageId,
     this.createdAt,
     this.updatedAt,
  });

  int? id;
  int? cmsId;
  int? stationId;
  String? title;
  String? description;
  String? time;
  int? charges;
  String? webLink;
  String? locationLink;
  String? callUs;
  String? languageId;
  dynamic createdAt;
  dynamic updatedAt;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
    id: json["id"],
    cmsId: json["cms_id"],
    stationId: json["station_id"],
    title: json["title"],
    description: json["description"],
    time: json["time"],
    charges: json["charges"],
    webLink: json["web_link"],
    locationLink: json["location_link"],
    callUs: json["callUs"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_id": stationId,
    "title": title,
    "description": description,
    "time": time,
    "charges": charges,
    "web_link": webLink,
    "location_link": locationLink,
    "callUs": callUs,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
