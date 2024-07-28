// To parse this JSON data, do
//
//     final postOfficeModel = postOfficeModelFromJson(jsonString);

import 'dart:convert';

PostOfficeModel postOfficeModelFromJson(String str) => PostOfficeModel.fromJson(json.decode(str));

String postOfficeModelToJson(PostOfficeModel data) => json.encode(data.toJson());

class PostOfficeModel {
  PostOfficeModel({
    this.status,
    this.message,
    this.postOfficeData,
  });

  int? status;
  String? message;
  List<PostOfficeDatum>? postOfficeData;

  factory PostOfficeModel.fromJson(Map<String, dynamic> json) => PostOfficeModel(
    status: json["status"],
    message: json["message"],
    postOfficeData:  json['data'] != null ? List<PostOfficeDatum>.from(json["data"].map((x) => PostOfficeDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(postOfficeData!.map((x) => x.toJson())),
  };
}

class PostOfficeDatum {
  PostOfficeDatum({
    this.id,
    this.cmsCategoryTitle,
    this.cmsCategoryImage,
    this.status,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.postOfficeList,
  });

  int? id;
  String? cmsCategoryTitle;
  String? cmsCategoryImage;
  int? status;
  String? languageId;
  dynamic createdAt;
  dynamic updatedAt;
  List<PostOfficeList>? postOfficeList;

  factory PostOfficeDatum.fromJson(Map<String, dynamic> json) => PostOfficeDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    postOfficeList: json['post_office_list'] != null ? List<PostOfficeList>.from(json["post_office_list"].map((x) => PostOfficeList.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "post_office_list": List<dynamic>.from(postOfficeList!.map((x) => x.toJson())),
  };
}

class PostOfficeList {
  PostOfficeList({
    this.id,
    this.cmsId,
    this.stationName,
    this.stationImage,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.postOfficeDetails,
  });

  int? id;
  int? cmsId;
  String? stationName;
  String? stationImage;
  String? languageId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<PostOfficeDetail>? postOfficeDetails;

  factory PostOfficeList.fromJson(Map<String, dynamic> json) => PostOfficeList(
    id: json["id"],
    cmsId: json["cms_id"],
    stationName: json["station_name"],
    stationImage: json["station_image"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    postOfficeDetails: json['post_office_details'] != null ? List<PostOfficeDetail>.from(json["post_office_details"].map((x) => PostOfficeDetail.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_name": stationName,
    "station_image": stationImage,
    "languageId": languageId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "post_office_details": List<dynamic>.from(postOfficeDetails!.map((x) => x.toJson())),
  };
}

class PostOfficeDetail {
  PostOfficeDetail({
    this.id,
    this.stationId,
    this.days,
    this.time,
    this.webLink,
    this.locationLink,
    this.callUs,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? stationId;
  String? days;
  String? time;
  String? webLink;
  String? locationLink;
  String? callUs;
  dynamic createdAt;
  dynamic updatedAt;

  factory PostOfficeDetail.fromJson(Map<String, dynamic> json) => PostOfficeDetail(
    id: json["id"],
    stationId: json["station_id"],
    days: json["days"],
    time: json["time"],
    webLink: json["web_link"],
    locationLink: json["location_link"],
    callUs: json["callUs"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "station_id": stationId,
    "days": days,
    "time": time,
    "web_link": webLink,
    "location_link": locationLink,
    "callUs": callUs,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
