import 'dart:convert';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart';
import 'package:agentapp/repo/recent_view_properties_repo.dart';
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:get/get.dart';

import 'listing_history_view_model.dart';

class RecentViewPropertiesViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  ListingHistoryViewModel _listingHistoryViewModel =
      Get.put(ListingHistoryViewModel());
  @override
  void onInit() {
    setRecentView();
    super.onInit();
  }

  List<dynamic> listsS = [];
  setRecentView() {
    listsS.clear();
    listsS = jsonDecode(
        globalPreferences!.getString(AppPreferences.RECENTLY_VIEW).toString());
    update();
  }

  ApiResponse get getRecentViewResponse => _getSApiResponse;

  Future<void> recentViewPropertiesViewModel({String? url}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAdvanceSearchPropertyResponseModel response =
          await RecentViewPropertyRepo.recentViewPropertyRepo(url: url);
      print("RecentViewPropertiesViewModel==>$response");
      if (response.response!.docs!.isNotEmpty)
        Get.to(PropertyDetailScreen(
          docs: response.response!.docs![0],
        ));
      _listingHistoryViewModel.listingHistoryViewModel(
          url:
              'StreetNumber:${response.response!.docs![0].unparsedAddress!.split(' ').first}* AND StreetName:${response.response!.docs![0].unparsedAddress!.split(' ').last}*');

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("RecentViewPropertiesViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
