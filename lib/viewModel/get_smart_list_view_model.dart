import 'dart:async';
import 'package:agentapp/models/responseModel/get_smart_list_response_model.dart';
import 'package:agentapp/repo/get_smart_list_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetSmartListViewModel extends GetxController {
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

  GetSmartListResponseModel? res;
  ApiResponse get getSmartListResponse => _getSApiResponse;

  Future<void> getSmartListViewModel({isLoadings = true}) async {
    updateIsLoading(true);
    if (isLoadings) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
    }
    try {
      GetSmartListResponseModel response =
          await GetSmartListRepo.getSmartListRepo(number: currentPage);

      if (currentPage == 1) {
        res = response;
      } else {
        response.smartlists!.forEach((element) {
          res?.smartlists!.add(element);
        });
      }
      if (response.smartlists!.isNotEmpty) {
        currentPage++;
      }
      _getSApiResponse = ApiResponse.complete(response);
      updateIsLoading(false);
    } catch (e) {
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }

  /// Refresh status data at every 10 seconds:
}
