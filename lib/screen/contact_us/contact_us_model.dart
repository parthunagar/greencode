// To parse this JSON data, do
//
//     final contactDetailsModel = contactDetailsModelFromJson(jsonString);

import 'dart:convert';

ContactDetailsModel contactDetailsModelFromJson(String str) => ContactDetailsModel.fromJson(json.decode(str));

String contactDetailsModelToJson(ContactDetailsModel data) => json.encode(data.toJson());

class ContactDetailsModel {
  ContactDetailsModel({
    this.status,
    this.message,
    this.contactDetailsData,
  });

  int? status;
  String? message;
  List<ContactDetailsDatum>? contactDetailsData;

  factory ContactDetailsModel.fromJson(Map<String, dynamic> json) => ContactDetailsModel(
    status: json["status"],
    message: json["message"],
    contactDetailsData: json['data'] != null ? List<ContactDetailsDatum>.from(json["data"].map((x) => ContactDetailsDatum.fromJson(x))) : null,
    // contactDetailsData: List<ContactDetailsDatum>.from(json["ContactDetailsData"].map((x) => ContactDetailsDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "ContactDetailsData": List<dynamic>.from(contactDetailsData!.map((x) => x.toJson())),
  };
}

class ContactDetailsDatum {
  ContactDetailsDatum({
    this.id,
    this.managementContactNumber,
    this.managementLink,
    this.languageId,
    this.technicalLink,
    this.technicalLocation,
    this.technicalEmail,
    this.technicalContactNumber,
    this.webLink,
    this.locationLink,
    this.callUs,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? managementContactNumber;
  String? managementLink;
  String? languageId;
  String? technicalLink;
  String? technicalLocation;
  String? technicalEmail;
  String? technicalContactNumber;
  String? webLink;
  String? locationLink;
  String? callUs;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ContactDetailsDatum.fromJson(Map<String, dynamic> json) => ContactDetailsDatum(
    id: json["id"],
    managementContactNumber: json["management_contact_number"],
    managementLink: json["management_link"],
    languageId: json["languageId"],
    technicalLink: json["technical_link"],
    technicalLocation: json["technical_location"],
    technicalEmail: json["technical_email"],
    technicalContactNumber: json["technical_contact_number"],
    webLink: json["web_link"],
    locationLink: json["location_link"],
    callUs: json["callUs"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "management_contact_number": managementContactNumber,
    "management_link": managementLink,
    "languageId": languageId,
    "technical_link": technicalLink,
    "technical_location": technicalLocation,
    "technical_email": technicalEmail,
    "technical_contact_number": technicalContactNumber,
    "web_link": webLink,
    "location_link": locationLink,
    "callUs": callUs,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
