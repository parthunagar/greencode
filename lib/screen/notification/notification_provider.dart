import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';
class NotificationProvider extends GetConnect {
  Future<dynamic> callNotificationList(String apiToken,int userId,String language) async {
    final response = await post(Api.notificationDetails, {
      'user_id': userId,
      'language_key': language,
    }, headers: {
      'Authorization': 'Bearer $apiToken'
    });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('Notification List => response.body : ${response.body}');
      debugPrint(
          'Notification List => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callNotification => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

  Future<dynamic> callDeleteNotification(String apiToken,String notificationId) async {
    final response = await post(Api.deleteNotification, {
      'notification_id': notificationId,
    },headers: {
    'Authorization': 'Bearer $apiToken'
    });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('Delete Notification => response.body : ${response.body}');
      debugPrint(
          'Delete Notification => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callDeleteNotification => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

}