import 'dart:async';
import 'package:agentapp/models/responseModel/get_recent_leads_response_model.dart';
import 'package:agentapp/repo/get_recent_leads_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetRecentLeadViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    super.onInit();
  }

  int currentPage = 1;

  updatePage() {
    currentPage = 1;
    update();
  }

  bool isLoading = false;
  updateIsLoading(bool val) {
    isLoading = val;
    update();
  }

  GetRecentLeadsResponseModel? res;

  ApiResponse get getRecentLeadsResponse => _getSApiResponse;

  Future<void> getRecentLeadViewModel({isLoadings = true}) async {
    updateIsLoading(true);
    if (isLoadings) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
    }
    try {
      GetRecentLeadsResponseModel response =
          await GetRecentLeadsRepo.getRecentLeadsRepo(number: currentPage);
      print("GetRecentLeadViewModel==>$response");
      if (currentPage == 1) {
        res = response;
      } else {
        response.events!.forEach((element) {
          res?.events!.add(element);
        });
      }
      if (response.events!.isNotEmpty) {
        currentPage++;
      }
      _getSApiResponse = ApiResponse.complete(response);
      updateIsLoading(false);
    } catch (e) {
      print("GetRecentLeadViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }

  /// Refresh status data at every 10 seconds:
// setUpTimedFetch() {
//   timer = Timer.periodic(const Duration(seconds: 10), (value) {
//     getStatusData();
//     print("STATUS DATA REFRESHED");
//   });
// }
}
