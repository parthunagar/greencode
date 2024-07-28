import 'package:get/get.dart';
// To parse this JSON data, do
//
//     final reservationListModel = reservationListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReservationListModel reservationListModelFromJson(String str) => ReservationListModel.fromJson(json.decode(str));

String reservationListModelToJson(ReservationListModel data) => json.encode(data.toJson());

class ReservationListModel {
  ReservationListModel({
   required this.status,
   required this.message,
   required this.reservationListData,
  });

  int status;
  String message;
  List<ReservationListDatum>? reservationListData;

  factory ReservationListModel.fromJson(Map<String, dynamic> json) => ReservationListModel(
    status: json["status"],
    message: json["message"],
    reservationListData: json['data'] != null ? List<ReservationListDatum>.from(json["data"].map((x) => ReservationListDatum.fromJson(x))) : null,
    // reservationListData: List<ReservationListDatum>.from(json["data"].map((x) => ReservationListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(reservationListData!.map((x) => x.toJson())),
  };
}

class ReservationListDatum {
  ReservationListDatum({
   required this.id,
   required this.clubId,
   required this.userId,
   required this.date,
   required this.paymentDate,
   required this.time,
   required this.adult,
   required this.child,
   required this.baby,
   required this.status,
   required this.createdAt,
   required this.updatedAt,
   required this.userName,
   required this.clubTitleInfo,
  });

  int id;
  int clubId;
  int userId;
  String date;
  String paymentDate;
  String time;
  int adult;
  int child;
  int baby;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<UserName>? userName;
  List<ClubTitleInfo>? clubTitleInfo;

  factory ReservationListDatum.fromJson(Map<String, dynamic> json) => ReservationListDatum(
    id: json["id"],
    clubId: json["club_id"],
    userId: json["user_id"],
    date: json["date"],
    paymentDate: json["payment_date"],
    time: json["time"],
    adult: json["adult"],
    child: json["child"],
    baby: json["baby"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    // userName: List<UserName>.from(json["user_name"].map((x) => UserName.fromJson(x))),
    userName: json['user_name'] != null ? List<UserName>.from(json["user_name"].map((x) => UserName.fromJson(x))) : null,
    // clubTitle: List<ClubTitle>.from(json["club_title"].map((x) => ClubTitle.fromJson(x))),
    clubTitleInfo: json['club_title_info'] != null ? List<ClubTitleInfo>.from(json["club_title_info"].map((x) => ClubTitleInfo.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "user_id": userId,
    "date": date,
    "payment_date": paymentDate,
    "time": time,
    "adult": adult,
    "child": child,
    "baby": baby,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_name": List<dynamic>.from(userName!.map((x) => x.toJson())),
    "club_title_info": List<dynamic>.from(clubTitleInfo!.map((x) => x.toJson())),
  };
}

class ClubTitleInfo {
  ClubTitleInfo({
   required this.id,
   required this.status,
   required this.clubTitle,
   required this.description,
   required this.languageId,
   required this.createdAt,
   required this.updatedAt,
   required this.clubImageInfo,
  });

  int? id;
  int? status;
  String? clubTitle;
  String? description;
  String? languageId;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<ClubImageInfo>? clubImageInfo;

  factory ClubTitleInfo.fromJson(Map<String, dynamic> json) => ClubTitleInfo(
    id: json["id"],
    status: json["status"],
    clubTitle: json["club_title"],
    description: json["description"],
    languageId: json["languageId"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    clubImageInfo: json['club_image_info'] != null ? List<ClubImageInfo>.from(json["club_image_info"].map((x) => ClubImageInfo.fromJson(x))) : null,
    // clubImage: List<ClubImage>.from(json["club_image"].map((x) => ClubImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "club_title": clubTitle,
    "description": description,
    "languageId": languageId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "club_image_info": List<dynamic>.from(clubImageInfo!.map((x) => x.toJson())),
  };
}

class ClubImageInfo {
  ClubImageInfo({
   required this.id,
   required this.clubId,
   required this.clubImageLink,
  });

  int? id;
  int? clubId;
  String? clubImageLink;

  factory ClubImageInfo.fromJson(Map<String, dynamic> json) => ClubImageInfo(
    id: json["id"],
    clubId: json["club_id"],
    clubImageLink: json["club_image_link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "club_id": clubId,
    "club_image_link": clubImageLink,
  };
}

class UserName {
  UserName({
   required this.id,
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.mobileNo,
   required this.address,
   required this.country,
   required this.state,
   required this.city,
   required this.pinCode,
   required this.status,
   required this.language,
   required this.emailVerifiedAt,
   required this.password,
   required this.otp,
   required this.image,
   required this.rememberToken,
   required this.createdAt,
   required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  dynamic mobileNo;
  dynamic address;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic pinCode;
  int status;
  String language;
  dynamic emailVerifiedAt;
  String password;
  String otp;
  dynamic image;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserName.fromJson(Map<String, dynamic> json) => UserName(
    id: json["id"],
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    email: json["email"] ?? '',
    mobileNo: json["mobile_no"] ?? '',
    address: json["address"] ?? '',
    country: json["country"] ?? '',
    state: json["state"] ?? '',
    city: json["city"] ?? '',
    pinCode: json["pin_code"] ?? '',
    status: json["status"] ?? '',
    language: json["language"] ?? '',
    emailVerifiedAt: json["email_verified_at"] ?? '',
    password: json["password"] ?? '',
    otp: json["otp"] ?? '',
    image: json["image"] ?? '',
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_no": mobileNo,
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "pin_code": pinCode,
    "status": status,
    "language": language,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "otp": otp,
    "image": image,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
