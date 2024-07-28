
import 'dart:io';

import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';
import 'notification_handler.dart';

class FirebaseNotifications {
  FirebaseMessaging? _messaging;
  BuildContext? myContext;

  void setupFirebase() {
    _messaging = FirebaseMessaging.instance;
    NotificationHandler.initNotification(navigatorKey.currentState!.context);
    firebaseCloudMessageListener(navigatorKey.currentState!.context);
    myContext = navigatorKey.currentState!.context;
  }

  void firebaseCloudMessageListener(BuildContext context)  async {
      NotificationSettings setting = await _messaging!.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
    _messaging!.getToken().then((token) async{
      debugPrint('firebaseCloudMessageListener => Token : ${token.toString()}');

      //handle message
      FirebaseMessaging.onMessage.listen((remoteMessage) {
        debugPrint('1. body : ${remoteMessage.notification!.body.toString()}');
        debugPrint('2. title : ${remoteMessage.notification!.title.toString()}');
        debugPrint('3. data : ${remoteMessage.data.toString()}');
      if(Platform.isAndroid) {
          showNotification(remoteMessage.notification!.title,remoteMessage.notification!.body,remoteMessage.data);

        }
        else if(Platform.isIOS) {
          showNotification(remoteMessage.notification!.title,remoteMessage.notification!.body,remoteMessage.data);
        }
      });
      // FirebaseMessaging.instance
      //     .getInitialMessage()
      //     .then((RemoteMessage? message) {
      //   debugPrint('handleMessage =>  message 1: $message');
      //   debugPrint('handleMessage =>  message.data 1: ${message!.data}');
      //   // debugPrint('handleMessage =>  message.data[\'userId\'] : ${message.data['userId']}');
      //   // if (message != null) {
      //   //   Navigator.pushNamed(
      //   //     context,
      //   //     '/message',
      //   //     arguments: MessageArguments(message, true),
      //   //   );
      //   // }
      // });
      // FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

      // FirebaseMessaging.onBackgroundMessage((message) {
      //   handleMessage(message);
      // });
    });
  }

  handleMessage(RemoteMessage message) async {
    print('handleMessage =>  message :');
    print('handleMessage =>  message : $message');
    print('handleMessage =>  message.data : ${message.data}');
    // debugPrint('handleMessage =>  message.data[\'userId\'] : ${message.data['userId']}');

    // var userIdInt = int.parse(message.data['userId']);
    // debugPrint('handleMessage onSelectNotification userIdInt : ${userIdInt}');
    // if(message.data.toString().toLowerCase().contains('booking')){
    //
    //   try {
    //     // if(payload[0].toString().toLowerCase() == 'notice'){}
    //     final logic = Get.find<DashboardController>();
    //     logic.changeTabIndex(2);
    //     logic.navigateBooking();
    //
    //   } catch (e) {
    //     debugPrint('onSelectNotification => ERROR : $e');
    //   }
    //
    //
    // }else {
    //   try {
    //     // if(payload[0].toString().toLowerCase() == 'notice'){}
    //     final logic = Get.find<DashboardController>();
    //     logic.changeTabIndex(0);
    //     var documents = '';
    //     var document = '';
    //     RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    //     Iterable<RegExpMatch> matches = exp.allMatches(message.data.toString());
    //
    //     matches.forEach((match) {
    //       documents = message.data.toString().substring(match.start, match.end);
    //       debugPrint(message.data.toString().substring(match.start, match.end));
    //     });
    //
    //     document = documents;
    //     debugPrint(document.toString());
    //     logic.navigateToNotice(document);
    //   } catch (e) {
    //     debugPrint('onSelectNotification => ERROR : $e');
    //   }
    // }
  }

  static void showNotification(title,body,data) async {
    // debugPrint('title : ${title.toString()} \nbody : ${body.toString()}');
    debugPrint('showNotification title : ${title.toString()}');
    debugPrint('showNotification body : ${body.toString()}');
    debugPrint('showNotification data : ${data.toString()}');
    // debugPrint('showNotification data : ${data['type'].toString()}');
    // debugPrint('showNotification data : ${data['roomId'].toString()}');
    // var androidChannel =  AndroidNotificationDetails(
    //   channel!.id,
    //   channel!.name,
    //   channelDescription: channel!.description,
    //     // autoCancel: true,
    //     // ongoing: true,
    //     importance: Importance.max,
    //     priority: Priority.high,
    //     // fullScreenIntent: false
    // );

    var ios = const IOSNotificationDetails();
    // var platform = NotificationDetails(android: androidChannel,iOS: ios);
    // var token = sharedPreferences.getString('Token');
    // debugPrint('showNotification => token : $token');
    // await NotificationHandler.flutterLocalNotificationPlugin.show(0, title, body, platform,payload: data.toString());
  }

}