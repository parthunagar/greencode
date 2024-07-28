// To parse this JSON data, do
//
//     final TaxiModel = taxiModeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TaxiModel taxiModeFromJson(String str) => TaxiModel.fromJson(json.decode(str));

String taxiModeToJson(TaxiModel data) => json.encode(data.toJson());

class TaxiModel {
  TaxiModel({
     this.status,
     this.message,
    this.taxiData,
  });

  int? status;
  String? message;
  List<TaxiDatum>? taxiData;

  factory TaxiModel.fromJson(Map<String, dynamic> json) => TaxiModel(
    status: json["status"],
    message: json["message"],
    taxiData:  json['data'] != null ? List<TaxiDatum>.from(json["data"].map((x) => TaxiDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(taxiData!.map((x) => x.toJson())),
  };
}

class TaxiDatum {
  TaxiDatum({
     this.id,
     this.cmsCategoryTitle,
     this.cmsCategoryImage,
     this.status,
     this.languageId,
     this.createdAt,
     this.updatedAt,
    this.cmsCategoryDetails,
  });

  int? id;
  String? cmsCategoryTitle;
  String? cmsCategoryImage;
  int? status;
  String? languageId;
  dynamic createdAt;
  dynamic updatedAt;
  List<CmsCategoryDetail>? cmsCategoryDetails;

  factory TaxiDatum.fromJson(Map<String, dynamic> json) => TaxiDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    cmsCategoryDetails:  json['cms_category_details'] != null ? List<CmsCategoryDetail>.from(json["cms_category_details"].map((x) => CmsCategoryDetail.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "cms_category_details": List<dynamic>.from(cmsCategoryDetails!.map((x) => x.toJson())),
  };
}

class CmsCategoryDetail {
  CmsCategoryDetail({
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
  dynamic? stationId;
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

  factory CmsCategoryDetail.fromJson(Map<String, dynamic> json) => CmsCategoryDetail(
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
