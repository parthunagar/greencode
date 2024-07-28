// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.status,
    required this.message,
    this.registerData,
  });

  int status;
  String message;
  Data? registerData;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
      registerData: json['data'] != null ? Data.fromJson(json["data"]):null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": registerData!.toJson(),
  };
}

class Data {
  Data({
    required this.isRegister,
  });

  int isRegister;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isRegister: json["is_register"],
  );

  Map<String, dynamic> toJson() => {
    "is_register": isRegister,
  };

}
