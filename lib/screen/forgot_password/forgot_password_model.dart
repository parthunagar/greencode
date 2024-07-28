import 'package:get/get.dart';

// class Sign_inLogic extends GetxController {
//
// }

// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
  ForgotPasswordModel({
    required this.status,
    required this.message,
    this.forgotPasswordData,
  });

  int status;
  String message;
  Data? forgotPasswordData;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
    status: json["status"],
    message: json["message"],
    forgotPasswordData:  json['data'] != null ? Data.fromJson(json["data"]):null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": forgotPasswordData!.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.status,
    required this.emailVerifiedAt,
    required this.image,
    required this.otp,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String mobileNo;
  String address;
  int status;
  dynamic emailVerifiedAt;
  String image;
  String otp;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    email: json["email"] ?? '',
    mobileNo: json["mobile_no"] ?? '',
    address: json["address"] ?? '',
    status: json["status"] ?? '',
    emailVerifiedAt: json["email_verified_at"] ?? '',
    image: json["image"] ?? '',
    otp: json["otp"] ?? '',
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
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "image": image,
    "otp": otp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
