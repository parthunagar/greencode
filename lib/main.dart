import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/utils/firebase_notificatation_handler.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';
import 'package:greencode/widget/localization_service.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'app_route/app_route.dart';
import 'constant/app_constant.dart';

bool? isLogin = false;
var serviceLanguage = LocalizationService.fallbackLocale;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background Handler : ${message.data.toString()}');
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
late FirebaseMessaging messaging;

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

// /// Create a [AndroidNotificationChannel] for heads up notifications
//
// FirebaseNotifications firebaseNotifications = FirebaseNotifications();
// FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
// AndroidNotificationChannel? channel;

// var navigatorKey = GlobalKey<NavigatorState>();

Future getLogin() async {
  isLogin = await Preference().readBool(Const.prefIsLoggedIn);
}

String? language = '';

Future setDefaultLocale() async {
  debugPrint('setDefaultLocale => language 1 : $language');
  language = await Preference().read(Const.prefLangName);
  debugPrint('setDefaultLocale => language 2 : $language');
  if (language == 'null' || language == '') {
    debugPrint('setDefaultLocale => language 3 : $language');
    await Preference().save(Const.prefLangName, LocalLanguages.langChinese);
    language = await Preference().read(Const.prefLangName);
    debugPrint('setDefaultLocale => language 4 : $language');
  }
  debugPrint('setDefaultLocale => language 5 : $language');
}

// Future<void> backgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Background Handler : ${message.data.toString()}');
//   Utils.flagBackGround = true;
//   // await Preference().saveBool(Const.prefNotificationRoutesSet, true);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  messaging = FirebaseMessaging.instance;
  messaging.subscribeToTopic("flutter-notification");

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'high_importance_channel', // title
        description: 'flutter_notification_description', // description
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        showBadge: true,
        playSound: true);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  // await Firebase.initializeApp();
  // Utils.flagBackGround = false;
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //   firebaseNotifications.setupFirebase();
  // });

  // if (!kIsWeb) {
  //   debugPrint('Flutter Android Channel');
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel',
  //     'High Importance Notifications',
  //     description: 'This channel is used for important notifications.',
  //     importance: Importance.high,
  //   );
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   await flutterLocalNotificationsPlugin!
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel!);
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //           alert: true, badge: false, sound: true);
  // }
  await setDefaultLocale();
  getLocalLanguage();
  await getLogin();
  print('Firebase.initializeApp() 5 ');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // await runZonedGuarded(() async {
  //
  //
  //
  //
  //
  //
  //       .then((_) {
  //     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //
  //   });
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });

}

void getLocalLanguage() {
  if (language == LocalLanguages.langChinese) {
    serviceLanguage = LocalizationService.fallbackLocale;
  } else if (language == LocalLanguages.langSimplified) {
    serviceLanguage = LocalizationService.simplifiedLocale;
  } else {
    serviceLanguage = LocalizationService.locale;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   // Navigator.pushNamed(context, '/message',
    //   //     arguments: MessageArguments(message, true));
    // });
    mainSetLocal();
  }

  @override
  Widget build(BuildContext context) {
    //
    debugPrint('MyApp => language 2 : $language');
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      locale: serviceLanguage,
      // localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate,],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        // DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Here !
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: LocalizationService.locales,
      // fallbackLocale: LocalizationService.locale,//LocalizationService.fallbackLocale,// Define the fallback locale, this will comes into the picture when an invalid locale is selected.
      translations: LocalizationService(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: cBrown,

        // Define the default font family.
        fontFamily: AppStyle.familyAbelPro,
      ),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute:
          isLogin == true ? AppRoute.dashboardScreen : AppRoute.registerScreen,
      // initialRoute: await Preference().readBool(Const.prefIsLoggedIn) AppRoute.signInScreen,
      getPages: AppRoute.pages,
    );
  }

  Future<void> mainSetLocal() async {
    await setDefaultLocale();
    getLocalLanguage();
  }
}
