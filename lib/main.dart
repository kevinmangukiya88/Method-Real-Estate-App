import 'package:agentapp/controllers/uiControllers/home_screen_controller.dart';
import 'package:agentapp/screens/leads/lead_claim_bottomsheet.dart';
import 'package:agentapp/services/notification_service.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/applicationController/application_controller.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/routes.dart';

Map<String, dynamic> notificationData = {};
RxBool isClaimed = false.obs;
RxBool loading = false.obs;
FlutterLocalNotificationsPlugin localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);
LocationPermission? permission;
void main() async {
  await initialization();

  runApp(MyApp());
}

Future<void> initialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  permission = await Geolocator.requestPermission();
  var applicationController = Get.put(ApplicationController());

  await Firebase.initializeApp();

  localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  try {
    AppNotificationHandler.flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
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
      print('MY Datta===${message?.data}');
      appModalBottomSheet(
        data: message?.data,
      );
    });

    AppNotificationHandler.initializeNotifications();

    AppNotificationHandler.showMsgHandler();

    globalPreferences = await SharedPreferences.getInstance();
  } catch (e) {
    // TODO
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  FBroadcast.instance().register(BroadcastEvent.EVENT_API_ERROR_HANDLING,
      applicationController.handlePresentableAPIErrors);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) async {
        if (message != null) {
          notificationData = message.data;
        }
      });
    } catch (e) {
      // TODO
    }

    return ScreenUtilInit(
      designSize: Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: GetMaterialApp(
            title: 'Method',
            debugShowCheckedModeBanner: false,
            initialRoute:
                globalPreferences!.getString(AppPreferences.TOKEN) != null &&
                        globalPreferences!
                            .getString(AppPreferences.TOKEN)!
                            .isNotEmpty
                    ? NamedRoutes.routeHome
                    : NamedRoutes.noLoginScreen,
            getPages: Routes.pages,
            theme: ThemeData(
              fontFamily: 'Avenir',
              primarySwatch: accentColorSwatch,
            ),
          ),
        );
      },
    );
  }
}
