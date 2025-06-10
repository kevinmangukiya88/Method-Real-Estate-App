import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? globalPreferences = null;

class AppPreferences {
  static const String ID_USER = "ID_USER";
  static const String TOKEN = "TOKEN";
  static const String USER_MODEL = "USER_MODEL";
  static const String RECENTLY_VIEW = "RECENTLY_VIEW";
  static const String FCM_TOKEN = "FCM_TOKEN";
  static const String MARKET_ID = "MARKET_ID";
  static const String SORT_FILTER = "SORT_FILTER";
  static const String MSL_ID = "MSL_ID";
  static const String LATITUDE = "LATITUDE";
  static const String LONGITUDE = "LONGITUDE";
  static const String CITY = "CITY";
  static const String NOTIFICATION_PAYLOAD = "NOTIFICATION_PAYLOAD";

  AppPreferences._();
}
