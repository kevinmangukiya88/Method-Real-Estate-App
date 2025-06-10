import 'package:get/get.dart';

class NoLoginController extends GetxController {
  bool showList = false;

  bool isAdvance = false;

  advanced(bool val) {
    isAdvance = val;
    update();
  }

  getShowList() {
    showList = !showList;
    update();
  }
}
