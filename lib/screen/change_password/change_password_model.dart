// To parse this JSON data, do
//
//     final changePassword = changePasswordFromJson(jsonString);

import 'dart:convert';

ChangePassword changePasswordFromJson(String str) => ChangePassword.fromJson(json.decode(str));

String changePasswordToJson(ChangePassword data) => json.encode(data.toJson());

class ChangePassword {
  ChangePassword({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  bool? data;

  factory ChangePassword.fromJson(Map<String, dynamic> json) => ChangePassword(
    status: json["status"],
    message: json["message"],
    data: json["data"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
