// To parse this JSON data, do
//
//     final SportCenterModel = sportCenterDataFromJson(jsonString);

import 'dart:convert';

SportCenterModel sportCenterDataFromJson(String str) => SportCenterModel.fromJson(json.decode(str));

String sportCenterDataToJson(SportCenterModel data) => json.encode(data.toJson());

class SportCenterModel {
  SportCenterModel({
    this.status,
    this.message,
    this.sportCenterData,
  });

  int? status;
  String? message;
  List<SportCenterDatum>? sportCenterData;

  factory SportCenterModel.fromJson(Map<String, dynamic> json) => SportCenterModel(
    status: json["status"],
    message: json["message"],
    sportCenterData:  json['data'] != null ? List<SportCenterDatum>.from(json["data"].map((x) => SportCenterDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(sportCenterData!.map((x) => x.toJson())),
  };
}

class SportCenterDatum {
  SportCenterDatum({
    this.id,
    this.cmsCategoryTitle,
    this.cmsCategoryImage,
    this.status,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.sportList,
  });

  int? id;
  String? cmsCategoryTitle;
  String? cmsCategoryImage;
  int? status;
  String? languageId;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<SportList>? sportList;

  factory SportCenterDatum.fromJson(Map<String, dynamic> json) => SportCenterDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    sportList:  json['sport_list'] != null ? List<SportList>.from(json["sport_list"].map((x) => SportList.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "sport_list": List<dynamic>.from(sportList!.map((x) => x.toJson())),
  };
}

class SportList {
  SportList({
    this.id,
    this.cmsId,
    this.stationName,
    this.stationImage,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.sportDetails,
  });

  int? id;
  int? cmsId;
  String? stationName;
  String? stationImage;
  String? languageId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<SportDetail>? sportDetails;

  factory SportList.fromJson(Map<String, dynamic> json) => SportList(
    id: json["id"],
    cmsId: json["cms_id"],
    stationName: json["station_name"],
    stationImage: json["station_image"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sportDetails:  json['sport_details'] != null ? List<SportDetail>.from(json["sport_details"].map((x) => SportDetail.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_name": stationName,
    "station_image": stationImage,
    "languageId": languageId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "sport_details": List<dynamic>.from(sportDetails!.map((x) => x.toJson())),
  };
}

class SportDetail {
  SportDetail({
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

  factory SportDetail.fromJson(Map<String, dynamic> json) => SportDetail(
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
