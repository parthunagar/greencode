// To parse this JSON data, do
//
//     final ResetPasswordModel = resetPasswordFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResetPasswordModel resetPasswordFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  ResetPasswordModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
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
    required this.country,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.status,
    required this.language,
    required this.emailVerifiedAt,
    required this.otp,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isRegister,
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
  String otp;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int isRegister;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    otp: json["otp"] ?? '',
    image: json["image"] ?? '',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isRegister: json["is_register"] ,
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
    "otp": otp,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_register":isRegister,
  };
}
