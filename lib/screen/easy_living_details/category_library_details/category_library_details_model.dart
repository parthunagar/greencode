// To parse this JSON data, do
//
//     final libraryDataModel = libraryDataModelFromJson(jsonString);

import 'dart:convert';

LibraryDataModel libraryDataModelFromJson(String str) => LibraryDataModel.fromJson(json.decode(str));

String libraryDataModelToJson(LibraryDataModel data) => json.encode(data.toJson());

class LibraryDataModel {
  LibraryDataModel({
    this.status,
    this.message,
    this.libraryData,
  });

  int? status;
  String? message;
  List<LibraryDatum>? libraryData;

  factory LibraryDataModel.fromJson(Map<String, dynamic> json) => LibraryDataModel(
    status: json["status"],
    message: json["message"],
    libraryData:  json['data'] != null ? List<LibraryDatum>.from(json["data"].map((x) => LibraryDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "libraryData": List<dynamic>.from(libraryData!.map((x) => x.toJson())),
  };
}

class LibraryDatum {
  LibraryDatum({
    this.id,
    this.cmsCategoryTitle,
    this.cmsCategoryImage,
    this.status,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.libraryList,
  });

  int? id;
  String? cmsCategoryTitle;
  String? cmsCategoryImage;
  int? status;
  String? languageId;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<LibraryList>? libraryList;

  factory LibraryDatum.fromJson(Map<String, dynamic> json) => LibraryDatum(
    id: json["id"],
    cmsCategoryTitle: json["cms_category_title"],
    cmsCategoryImage: json["cms_category_image"],
    status: json["status"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    libraryList:  json['library_list'] != null ? List<LibraryList>.from(json["library_list"].map((x) => LibraryList.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_category_title": cmsCategoryTitle,
    "cms_category_image": cmsCategoryImage,
    "status": status,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "library_list": List<dynamic>.from(libraryList!.map((x) => x.toJson())),
  };
}

class LibraryList {
  LibraryList({
    this.id,
    this.cmsId,
    this.stationName,
    this.stationImage,
    this.languageId,
    this.createdAt,
    this.updatedAt,
    this.libraryDetails,
  });

  int? id;
  int? cmsId;
  String? stationName;
  String? stationImage;
  String? languageId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<LibraryDetail>? libraryDetails;

  factory LibraryList.fromJson(Map<String, dynamic> json) => LibraryList(
    id: json["id"],
    cmsId: json["cms_id"],
    stationName: json["station_name"],
    stationImage: json["station_image"],
    languageId: json["languageId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    libraryDetails:  json['library_details'] != null ? List<LibraryDetail>.from(json["library_details"].map((x) => LibraryDetail.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_name": stationName,
    "station_image": stationImage,
    "languageId": languageId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "library_details": List<dynamic>.from(libraryDetails!.map((x) => x.toJson())),
  };
}

class LibraryDetail {
  LibraryDetail({
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

  factory LibraryDetail.fromJson(Map<String, dynamic> json) => LibraryDetail(
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
