class BackNavigationHandler {
  static final BackNavigationHandler _singleton = BackNavigationHandler._internal();

  factory BackNavigationHandler() {
    return _singleton;
  }

  BackNavigationHandler._internal();

  void onBackEvent(String tag, {value}) async {
    // APIController controller = Get.find(tag: tag);
  }
}
