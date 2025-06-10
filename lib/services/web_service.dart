import 'dart:convert';
import 'package:agentapp/screens/propertyDetail/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/baseModel/base_model.dart';
import '../utils/app_preferences.dart';
import '../utils/constants.dart';
import '../utils/handlers.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class Webservice {
  static final Webservice _singleton = Webservice._internal();

  factory Webservice() {
    return _singleton;
  }

  Webservice._internal();

  Map<String, String> appHeaders() {
    Map<String, String> headers;
    if (isNotEmpty(globalPreferences?.getString(AppPreferences.TOKEN))) {
      var token = globalPreferences?.getString(AppPreferences.TOKEN);
      logMessage(globalPreferences?.getString(AppPreferences.ID_USER));
      headers = {
        "accept": "*/*",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    } else {
      headers = {
        "accept": "*/*",
        "Content-Type": "application/json",
      };
    }
    return headers;
  }

  Future<BaseModel> apiCallLogin(Map<String, dynamic> jsonMap, RxBool isLoading,
      BuildContext context) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      Map<String, String> headers = appHeaders();

      logMessage(jsonMap);

      var uri = Uri(
        scheme: Uri.parse(APIEndpoints.LOGIN).scheme,
        host: Uri.parse(APIEndpoints.LOGIN).host,
        path: Uri.parse(APIEndpoints.LOGIN).path,
      );

      var response = await http.post(uri,
          body: jsonEncode(jsonMap),
          headers: headers,
          encoding: Encoding.getByName("utf-8"));

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        print('TOKEN==${responseMap}');
        return BaseModel.fromMap(responseMap);
      } else {
        CommonWidget.getSnackBar(context,
            message:
                '${(jsonDecode(response.body)['message'] is List) ? jsonDecode(response.body)['message'][0] : jsonDecode(response.body)['message']}',
            duration: 2,
            colorText: Colors.white,
            color: Colors.black);
        Handlers().apiResponseHandler(response);

        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }

  Future<BaseModel> apiCallChangePassword(
      Map<String, dynamic> jsonMap, RxBool isLoading) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      Map<String, String> headers = appHeaders();

      logMessage(jsonMap);

      var uri = Uri(
        scheme: Uri.parse(APIEndpoints.CHANGE_PASSWORD).scheme,
        host: Uri.parse(APIEndpoints.CHANGE_PASSWORD).host,
        path: Uri.parse(APIEndpoints.CHANGE_PASSWORD).path,
      );

      var response = await http.post(uri,
          body: jsonEncode(jsonMap),
          headers: headers,
          encoding: Encoding.getByName("utf-8"));

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        return BaseModel.fromMap(responseMap);
      } else {
        Handlers().apiResponseHandler(response);
        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }

  Future<BaseModel> apiCallFetchRecentlyAddedKnowledgeBases(
      Map<String, dynamic> jsonMap, RxBool isLoading) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      Map<String, String> headers = appHeaders();

      logMessage(jsonMap);

      var uri = Uri(
          scheme: Uri.parse(APIEndpoints.RECENTLY_ADDED_KNOWLEDGEBASES).scheme,
          host: Uri.parse(APIEndpoints.RECENTLY_ADDED_KNOWLEDGEBASES).host,
          path: Uri.parse(APIEndpoints.RECENTLY_ADDED_KNOWLEDGEBASES).path,
          queryParameters: jsonMap);

      var response = await http.get(uri, headers: headers);

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        print('RESPONSE==${responseMap}');
        return BaseModel.fromMap(responseMap);
      } else {
        Handlers().apiResponseHandler(response);
        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }

  Future<BaseModel> apiCallSaveVideoProgress(
      Map<String, dynamic> jsonMap, RxBool isLoading) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      Map<String, String> headers = appHeaders();

      logMessage(jsonMap);

      var uri = Uri(
        scheme: Uri.parse(APIEndpoints.SAVE_VIDEO_PROGRESS).scheme,
        host: Uri.parse(APIEndpoints.SAVE_VIDEO_PROGRESS).host,
        path: Uri.parse(APIEndpoints.SAVE_VIDEO_PROGRESS).path,
      );

      var response = await http.post(uri,
          body: jsonEncode(jsonMap),
          headers: headers,
          encoding: Encoding.getByName("utf-8"));

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        print('DATA==${responseMap}');
        return BaseModel.fromMap(responseMap);
      } else {
        Handlers().apiResponseHandler(response);
        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }
}
