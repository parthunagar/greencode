// To parse this JSON data, do
//
//     final busDetailsModel = busDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusDetailsModel busDetailsModelFromJson(String str) => BusDetailsModel.fromJson(json.decode(str));

String busDetailsModelToJson(BusDetailsModel data) => json.encode(data.toJson());

class BusDetailsModel {
  BusDetailsModel({
     this.status,
     this.message,
     this.busDetailsData,
  });

  int? status;
  String? message;
  BusDetailsData? busDetailsData;

  factory BusDetailsModel.fromJson(Map<String, dynamic> json) => BusDetailsModel(
    status: json["status"],
    message: json["message"],
    busDetailsData: json['data'] != null ? BusDetailsData.fromJson(json["data"]) : null,
    // busDetailsData: BusDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": busDetailsData!.toJson(),
  };
}

class BusDetailsData {
  BusDetailsData({
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

  factory BusDetailsData.fromJson(Map<String, dynamic> json) => BusDetailsData(
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
