import 'dart:convert';
import 'dart:io';

import 'package:agentapp/screens/leads/lead_claim_bottomsheet.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class AppNotificationHandler {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void getInitialMsg() {
    try {
      try {
        globalPreferences!.remove(AppPreferences.NOTIFICATION_PAYLOAD);
      } catch (e) {
        // TODO
      }
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        try {
          globalPreferences!.setString(
              AppPreferences.NOTIFICATION_PAYLOAD, message!.data.toString());
        } catch (e) {
          // TODO
        }
      });
    } on FirebaseException catch (e) {
      print('notification 5 ${e.message}');
    }
  }

  static Future<void> initializeNotifications() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    try {
      getInitialMsg();
    } catch (e) {
      // TODO
    }

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        badge: true, alert: true, sound: true);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the message and perform any necessary actions
    });
  }

  static Future<dynamic> onSelectNotification(String? payload) async {
    if (payload != null) {
      var m = jsonDecode(payload);
      if (isBottomSheetOpen.value == true) {
        Get.back();
        try {
          DetailData.timer = null;
        } catch (e) {}
        try {
          DetailData.timer = null;
        } catch (e) {}
      }
      isBottomSheetOpen.value = true;
      appModalBottomSheet(data: m);
    }
  }

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
      playSound: true);

  static void showMsgHandler() {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
        RemoteNotification? notification = message!.notification;

        if (Platform.isAndroid) {
          showMsgNormal(notification!, message);
        }
      });
    } on FirebaseException catch (e) {
      print('notification 6 ${e.message}');
    }
  }

  static void showMsgNormal(
      RemoteNotification notification, RemoteMessage msg) {
    try {
      String screen = jsonEncode(msg.data);
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              importance: Importance.high,
              priority: Priority.high,
              fullScreenIntent: true,

              icon: '@mipmap/ic_launcher',
            ),
            iOS: IOSNotificationDetails(),
          ),
          payload: screen);
    } on FirebaseException catch (e) {
      print('notification 3 ${e.message}');
    }
  }

  ///background notification handler..  when app in background
  Future<dynamic> notificationTap(paylode) async {
    print('DATYA======${paylode}');
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    try {
      print('background notification handler..');

      await Firebase.initializeApp();
      // initializeNotifications();
      print('Handling a background message ${message.messageId}');
      RemoteNotification? notification = message.notification;
      // appModalBottomSheet(data: message.data);
      print('background notification handler..${notification!.bodyLocArgs}');
    } on FirebaseException catch (e) {
      print('notification 1 ${e.message}');
    }
  }

  ///call when click on notification back

  static void onMsgOpen() {
    print('call when click on notification back');
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        if (message != null) {
          print("action======2=== ${message.data['click_action']}");
        }
      },
    );
  }
}
