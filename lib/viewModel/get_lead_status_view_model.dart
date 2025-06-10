import 'dart:async';
import 'package:agentapp/main.dart';
import 'package:agentapp/models/responseModel/get_lead_status_response_model.dart';
import 'package:agentapp/repo/get_lead_status_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

import 'store_lead_detail.dart';

class GetLeadStatusViewModel extends GetxController {
  static ApiResponse _getSApiResponse =
      ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getLeadsStatusResponse => _getSApiResponse;

  changeStatus(bool val) {
    isClaimed.value = val;
  }

  setLoading(bool val) {
    loading.value = val;
    // if (val == true) {
    //   DetailData.timer?.cancel();
    //
    //   DetailData.timer = null;
    // }
  }

  Future<void> getLeadStatusViewModel({String? leadId}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    // try {
    GetLeadStatusResponseModel response =
        await GetLeadStatusRepo.getLeadStatusRepo(id: leadId);
    changeStatus(response.claimed!);

    if (response.claimed == true) {
      setLoading(false);
      DetailData.timer?.cancel();
      DetailData.timer = null;
      update();
    }
    _getSApiResponse = ApiResponse.complete(response);

    // } catch (e) {
    //   _getSApiResponse = ApiResponse.error(message: 'error');
    // }
    update();
  }
}
