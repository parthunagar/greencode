// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterWithEmailModel registerWithEmailModelFromJson(String str) => RegisterWithEmailModel.fromJson(json.decode(str));

String registerWithEmailModelToJson(RegisterWithEmailModel data) => json.encode(data.toJson());

class RegisterWithEmailModel {
  RegisterWithEmailModel({
    required this.status,
    required this.message,
    this.registerData,
  });

  int status;
  String message;
  Data? registerData;

  factory RegisterWithEmailModel.fromJson(Map<String, dynamic> json) => RegisterWithEmailModel(
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
