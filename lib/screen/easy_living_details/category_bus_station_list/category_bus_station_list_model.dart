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
// To parse this JSON data, do
//
//     final busStationListModel = busStationListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final busStationListModel = busStationListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusStationListModel busStationListModelFromJson(String str) => BusStationListModel.fromJson(json.decode(str));

String busStationListModelToJson(BusStationListModel data) => json.encode(data.toJson());

class BusStationListModel {
  BusStationListModel({
    required this.status,
    required this.message,
    required this.busStationData,
  });

  int status;
  String message;
  List<BusStationDatum>? busStationData;

  factory BusStationListModel.fromJson(Map<String, dynamic> json) => BusStationListModel(
    status: json["status"],
    message: json["message"],
    busStationData:  json['data'] != null ? List<BusStationDatum>.from(json["data"].map((x) => BusStationDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(busStationData!.map((x) => x.toJson())),
  };
}

class BusStationDatum {
  BusStationDatum({
    required this.id,
    required this.cmsCategoryTitle,
    required this.cmsCategoryImage,
    required this.status,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
    required this.stationList,
  });

  int id;
  String cmsCategoryTitle;
  String cmsCategoryImage;
  int status;
  String languageId;
  dynamic createdAt;
  dynamic updatedAt;
  List<StationList>? stationList;

  factory BusStationDatum.fromJson(Map<String, dynamic> json) => BusStationDatum(
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
    required this.id,
    required this.cmsId,
    required this.stationName,
    required this.stationImage,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int cmsId;
  String stationName;
  String stationImage;
  DateTime createdAt;
  DateTime updatedAt;

  factory StationList.fromJson(Map<String, dynamic> json) => StationList(
    id: json["id"],
    cmsId: json["cms_id"],
    stationName: json["station_name"],
    stationImage: json["station_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cms_id": cmsId,
    "station_name": stationName,
    "station_image": stationImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
