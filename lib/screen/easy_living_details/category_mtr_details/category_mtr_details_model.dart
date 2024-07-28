// To parse this JSON data, do
//
//     final mtrDetailsModel = mtrDetailsModelFromJson(jsonString);

import 'dart:ffi';

import 'package:meta/meta.dart';
import 'dart:convert';

MtrDetailsModel mtrDetailsModelFromJson(String str) => MtrDetailsModel.fromJson(json.decode(str));

String mtrDetailsModelToJson(MtrDetailsModel data) => json.encode(data.toJson());

class MtrDetailsModel {
  MtrDetailsModel({
     this.status,
     this.message,
     this.mtrDetailsData,
  });

  int? status;
  String? message;
  List<MtrDetailsDatum>? mtrDetailsData;

  factory MtrDetailsModel.fromJson(Map<String, dynamic> json) => MtrDetailsModel(
    status: json["status"],
    message: json["message"],
    mtrDetailsData:  json['data'] != null ? List<MtrDetailsDatum>.from(json["data"].map((x) => MtrDetailsDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(mtrDetailsData!.map((x) => x.toJson())),
  };
}

class MtrDetailsDatum {
  MtrDetailsDatum({
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

  factory MtrDetailsDatum.fromJson(Map<String, dynamic> json) => MtrDetailsDatum(
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
    // categoryDetails: List<CategoryDetail>.from(json["category_details"].map((x) => CategoryDetail.fromJson(x))),
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
  var charges;
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
    webLink: json["web_link"] == null ? null : json["web_link"],
    locationLink: json["location_link"] == null ? null : json["location_link"],
    callUs: json["callUs"] == null ? null : json["callUs"],
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
    "web_link": webLink == null ? null : webLink,
    "location_link": locationLink == null ? null : locationLink,
    "callUs": callUs == null ? null : callUs,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
