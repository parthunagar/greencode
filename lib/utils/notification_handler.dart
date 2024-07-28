import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../screen/dashboard/dashboard_controller.dart';


class NotificationHandler {
  static final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  static BuildContext? myContext;

  static void initNotification(BuildContext context) {
    myContext = context;
    var initAndroid = const AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    var initIOS = const IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initSetting = InitializationSettings(
        android: initAndroid, iOS: initIOS);
    flutterLocalNotificationPlugin.initialize(
        initSetting, onSelectNotification: onSelectNotification);
  }


  static Future onSelectNotification(String? payload) async {
    debugPrint('payload : ${payload}');
    if (payload != null) {
      if(payload.toString().toLowerCase().contains('booking')){
        try {
          // if(payload[0].toString().toLowerCase() == 'notice'){}
          final logic = Get.find<DashboardController>();
          logic.changeTabIndex(2);
          logic.navigateBooking();

        } catch (e) {
          debugPrint('onSelectNotification => ERROR : $e');
        }
      }else {
        try {
          // if(payload[0].toString().toLowerCase() == 'notice'){}
          final logic = Get.find<DashboardController>();
          logic.changeTabIndex(0);
          var documents = '';
          var document = '';
          RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
          Iterable<RegExpMatch> matches = exp.allMatches(payload.toString());

          matches.forEach((match) {
            documents = payload.toString().substring(match.start, match.end);
            debugPrint(payload.toString().substring(match.start, match.end));
          });

          document = documents;
          debugPrint(document.toString());
          logic.navigateToNotice(document);
        } catch (e) {
          debugPrint('onSelectNotification => ERROR : $e');
        }
      }


      // try {
      //   QBSession? session = await QB.auth.getSession();
      //   if(session != null){
      //     debugPrint('onSelectNotification session!.token : ${session.token}');
      //     debugPrint('onSelectNotification applicationId : ${session.applicationId}');
      //     Get.toNamed(AppRoutes.chatScreen, arguments: {
      //       NavigationArgs.opponentId :  userIdInt,
      //       NavigationArgs.opponentUsername :   userNameString,
      //     });
      //   } else {
      //
      //
      //
      //   }
      //
      // } on PlatformException catch (e) {
      //
      //   final logic = Get.find<LoginScreenLogic>();
      //   logic.loginnoti(userIdInt, "parthv");
      //
      // }
    }
  }

  static Future onDidReceiveLocalNotification(int? id, String? title,
      String? body, String? payload) async {
    debugPrint('onDidReceiveLocalNotification => id : $id');
    debugPrint('onDidReceiveLocalNotification => title : $title');
    debugPrint('onDidReceiveLocalNotification => body : $body');
    debugPrint('onDidReceiveLocalNotification => payload : $payload');
  }

}
