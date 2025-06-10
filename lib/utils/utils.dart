import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/popups/validation_error_popup.dart';
import 'app_preferences.dart';
import 'constants.dart';
import 'package:intl/intl.dart';

void showToast(String title, String content, {success = false}) {
  Get.dialog(ValidationErrorPopup(
    content: content,
    title: title,
    success: success,
  ));
}

void logMessage(message) {
  if (kDebugMode) {
    print("####--->${message}");
  }
}
// Future<void> openMap(double originLatitude, double originLongitude,double destLatitude, double destLongitude) async {
//   String origin = '${originLatitude},${originLongitude}';
//   String destination = '${destLatitude},${destLongitude}';
//   String googleUrl =
//       "https://www.google.com/maps/dir/?api=1&origin=" + origin + "&destination=" + destination + "&travelmode=driving&dir_action=navigate";
//   if (await canLaunch(googleUrl)) {
//     await launch(googleUrl);
//   }
// }
//

Future<bool> appHasInternetConnectivity() async =>
    await InternetConnectionChecker().hasConnection;

Future<void> openLink(String url) async {
  Uri uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

// List<LatLng> decodePolyline(String encoded) {
//   List<LatLng> points = [];
//   int index = 0, len = encoded.length;
//   int lat = 0, lng = 0;
//   while (index < len) {
//     int b, shift = 0, result = 0;
//     do {
//       b = encoded.codeUnitAt(index++) - 63;
//       result |= (b & 0x1f) << shift;
//       shift += 5;
//     } while (b >= 0x20);
//     int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//     lat += dlat;
//     shift = 0;
//     result = 0;
//     do {
//       b = encoded.codeUnitAt(index++) - 63;
//       result |= (b & 0x1f) << shift;
//       shift += 5;
//     } while (b >= 0x20);
//     int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//     lng += dlng;
//     LatLng p = new LatLng(lat / 1E5, lng / 1E5);
//     points.add(p);
//   }
//   return points;
// }

bool isNotEmpty(value) {
  if (value != null && value != '') {
    return true;
  }
  return false;
}

bool isEmpty(value) {
  if (value == null || value == '') {
    return true;
  }
  return false;
}

verticalSpace({height = 10}) {
  return SizedBox(
    height: (height as int).toDouble(),
  );
}

horizontalSpace({width = 10}) {
  return SizedBox(
    width: (width as int).toDouble(),
  );
}

String formatHHMMSS(int seconds) {
  if (seconds != null && seconds != 0) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "${hoursStr}h:${minutesStr}m:${secondsStr}s";
  } else {
    return "00h:00m:00s";
  }
}

String formatDDHHMMSS(int seconds) {
  if (seconds != null && seconds != 0) {
    int days = (seconds / 86400).truncate();
    seconds = (seconds % 86400).truncate();
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    int sec = seconds % 60;

    String daysStr = (days).toString().padLeft(2, '0');
    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = sec.toString().padLeft(2, '0');

    return "${daysStr}d:${hoursStr}h:${minutesStr}m:${secondsStr}s";
  } else {
    return "00d:00h:00m:00s";
  }
}

// String calculateDaysLeft(int seconds) {
//   if (seconds != null && seconds != 0) {
//     int days = (seconds / 86400).truncate();
//     if (days > 0) {
//       String daysStr = (days).toString();
//       return "$daysStr ${days == 0 ? tr('day') : tr('days')}";
//     } else {
//       return tr('Today');
//     }
//   } else {
//     return "00d:00h:00m:00s";
//   }
// }

String formatDate(DateTime date, {format = "EEE, MMM dd"}) {
  return DateFormat(format).format(date);
}

DateTime parseDate(String date, {String format = "EEE, MMM dd"}) {
  if (isDate(date, format: format)) {
    return DateFormat(format).parse(date);
  } else {
    return DateTime.now();
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

bool isDate(String str, {String format = "yyyy-MM-dd'T'HH:mm:ss"}) {
  try {
    DateFormat(format).parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

void logoutUser() {
  if (isNotEmpty(globalPreferences?.getString(AppPreferences.TOKEN))) {
    logout();
  }
}

void uploadFile(String pickedAction, Function(XFile? photo) callback,
    {FilePicker filePicker = FilePicker.photo}) async {
  final ImagePicker _picker = ImagePicker();

  final XFile? file;

  if (filePicker == FilePicker.photo) {
    file = (pickedAction == 'camera')
        ? await _picker.pickImage(source: ImageSource.camera, imageQuality: 30)
        : await _picker.pickImage(
            source: ImageSource.gallery, imageQuality: 30);
  } else {
    file = await _picker.pickVideo(
        source: ImageSource.gallery, maxDuration: Duration(seconds: 60));
  }

  if (isNotEmpty(file)) {
    var compressedFile = await compressImageFile(file!.path);
    callback(compressedFile);
  }
}

Future<XFile> compressImageFile(String filePath) async {
  final tmpDir = (await getTemporaryDirectory()).path;
  final target = '$tmpDir/${DateTime.now().millisecondsSinceEpoch}.jpeg';
  var result = await FlutterImageCompress.compressAndGetFile(
    filePath,
    target,
    format: CompressFormat.jpeg,
    quality: 35,
  );
  if (isNotEmpty(result)) {
    return result!;
  } else {
    return XFile('pending');
  }
}

void logout() {
  globalPreferences?.setString(AppPreferences.ID_USER, '');
  globalPreferences?.setString(AppPreferences.TOKEN, '');
  globalPreferences?.setString(AppPreferences.FCM_TOKEN, '');
  globalPreferences?.setString(AppPreferences.USER_MODEL, '');
  globalPreferences?.setString(AppPreferences.RECENTLY_VIEW, '');
  Get.offNamedUntil(NamedRoutes.noLoginScreen, (route) => false);
}
