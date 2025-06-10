import 'package:get/get.dart';

import '../../utils/utils.dart';

class ApplicationController extends GetxController{
  //Define all variables here that need application scope

  void handlePresentableAPIErrors(value, callback) {
    if (isNotEmpty(value)) {
      if (value is Map) {
        var statusCode = value['statusCode'];
        var errMsg = value['errMsg'];
        if (statusCode == 440) {
          Future.delayed(Duration(seconds: 1), () {
            logoutUser();
          });
        } else {
          showToast('Error!', errMsg.toString());
        }
      }
    }
  }
}