import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController {
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());

  bool isFMlsSelected = true;
  bool isMlsSelected = false;

  void changeFMLSValue() {
    if (isFMlsSelected == true) {
      isFMlsSelected = false;
      isMlsSelected = true;
    } else {
      isFMlsSelected = true;
      isMlsSelected = false;
    }
    update();
  }

  void changeMLSValue() {
    if (isMlsSelected == true) {
      isMlsSelected = false;
      isFMlsSelected = true;
    } else {
      isMlsSelected = true;
      isFMlsSelected = false;
    }
    update();
  }
}
