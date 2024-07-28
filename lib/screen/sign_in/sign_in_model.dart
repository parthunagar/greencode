// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.status,
    required this.message,
    this.signInData,
  });

  int status;
  String message;
  Data? signInData;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"],
    message: json["message"],
    signInData: json['data'] != null ? Data.fromJson(json["data"]):null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": signInData!.toJson(),
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
    required this.createdAt,
    required this.updatedAt,
    required this.bearerToken,
    required this.roles,
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
  DateTime createdAt;
  DateTime updatedAt;
  String bearerToken;
  List<Role>? roles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"] ?? '',
    lastName: json["last_name"] ?? '',
    email: json["email"] ?? '',
    mobileNo: json["mobile_no"] ?? '' ,
    address: json["address"] ?? '',
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"] ?? '',
    image: json["image"] ?? '',
    createdAt: DateTime.parse(json["created_at"]) ,
    updatedAt: DateTime.parse(json["updated_at"]),
    bearerToken: json["bearer_token"] ?? '',
    roles: json['roles'] != null ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x))) : null,
    // roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "bearer_token": bearerToken,
    "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
