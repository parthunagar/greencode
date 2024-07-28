// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) => NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) => json.encode(data.toJson());

class NotificationListModel {
  NotificationListModel({
    this.status,
    this.message,
    this.notificationData,
  });

  int? status;
  String? message;
  List<NotificationDatum>? notificationData;

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
    status: json["status"],
    message: json["message"],
    notificationData: json['data'] != null ? List<NotificationDatum>.from(json["data"].map((x) => NotificationDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(notificationData!.map((x) => x.toJson())),
  };
}

class NotificationDatum {
  NotificationDatum({
    this.id,
    this.notificationId,
    this.userId,
    this.isRead,
    this.isDelete,
    this.notificationType,
    this.status,
    this.bookingId,
    this.languageId,
    this.title,
    this.description,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    required this.isCheck,
  });

  int? id;
  int? notificationId;
  int? userId;
  int? isRead;
  int? isDelete;
  String? notificationType;
  String? status;
  int? bookingId;
  String? languageId;
  String? title;
  String? description;
  DateTime? date;
  String? time;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isCheck;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
    id: json["id"],
    notificationId: json["notification_id"] == null ? null : json["notification_id"],
    userId: json["user_id"],
    isRead: json["isRead"],
    isDelete: json["isDelete"],
    notificationType: json["notification_type"],
    status: json["status"] == null ? null : json["status"],
    bookingId: json["booking_id"] == null ? null : json["booking_id"],
    languageId: json["languageId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"] == null ? null : json["time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isCheck: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "notification_id": notificationId == null ? null : notificationId,
    "user_id": userId,
    "isRead": isRead,
    "isDelete": isDelete,
    "notification_type": notificationType,
    "status": status == null ? null : status,
    "booking_id": bookingId == null ? null : bookingId,
    "languageId": languageId,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time == null ? null : time,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "isCheck": isCheck,
  };
}
