import 'dart:convert';

import 'package:agentapp/models/user_token_model.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  //Define all variables here that binds to activity lifetime scope
  var userInformation = UserDetailsBean.fromMap({}).obs;

  @override
  void onInit() {
    super.onInit();
    try {
      var jsonMap = jsonDecode(
          globalPreferences?.getString(AppPreferences.USER_MODEL) ?? '{}');
      userInformation.value = UserDetailsBean.fromMap(jsonMap);
    } catch (e) {
      // TODO
    }
  }

  RxBool isLandscape = false.obs;

  Future<void> setLandscape() async {
    if (isLandscape.isTrue) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft]);
      update();
    }
  }

  Future<void> setPortrait() async {
    if (isLandscape.isFalse) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
      update();
    }
  }
}
