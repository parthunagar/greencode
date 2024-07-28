// To parse this JSON data, do
//
//     final userDetail = userDetailFromJson(jsonString);

import 'dart:convert';

UserDetail userDetailFromJson(String str) => UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({this.status, this.message, this.userDetailData,});

  int? status;
  String? message;
  UserDetailData? userDetailData;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    status: json["status"],
    message: json["message"],
    userDetailData: json["data"] != null ? UserDetailData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": userDetailData!.toJson(),
  };
}

class UserDetailData {
  UserDetailData({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNo,
    this.flatNumberCode,
    this.residentName,
    this.residentTypeTitle,
    this.address,
    this.country,
    this.state,
    this.city,
    this.pinCode,
    this.status,
    this.language,
    this.emailVerifiedAt,
    this.password,
    this.otp,
    this.userNumber,
    this.image,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  int? id,status;
  String? firstName,lastName,email,mobileNo,flatNumberCode,address,language,userNumber,password,image,residentName,residentTypeTitle;
  dynamic country,state,city,pinCode,emailVerifiedAt,otp,rememberToken;
  DateTime? createdAt, updatedAt;

  factory UserDetailData.fromJson(Map<String, dynamic> json) => UserDetailData(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobileNo: json["mobile_no"],
    flatNumberCode: json["flat_number_code"],
    residentName: json["resident_name"],
    residentTypeTitle: json["resident_type_title"],
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    pinCode: json["pin_code"],
    status: json["status"],
    language: json["language"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    otp: json["otp"],
    userNumber: json["user_number"],
    image: json["image"],
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
    "resident_type_title": residentTypeTitle,
    "state": state,
    "city": city,
    "pin_code": pinCode,
    "status": status,
    "language": language,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "otp": otp,
    "user_number": userNumber,
    "image": image,
    "remember_token": rememberToken,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
