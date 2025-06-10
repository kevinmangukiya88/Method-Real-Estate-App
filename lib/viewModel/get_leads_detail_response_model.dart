import 'dart:async';
import 'package:agentapp/repo/get_leads_detail_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetLeadsDetailsViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  bool apiCalls = false;

  @override
  void onInit() {
    super.onInit();
  }

  String leadDropDownValue = '';

  changeLeadDropDownValue(String value) {
    leadDropDownValue = value;
    update();
  }

  ApiResponse get getLeadsDetailResponse => _getSApiResponse;

  Future<void> getLeadsDetailsViewModel(
      {String? leadId, bool apiCall = false}) async {
    apiCalls = apiCall;
    if (apiCall) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
      try {
        var data =
            await GetLeadsDetailsRepo.getLeadsDetailsRepo(leadId: leadId);
        print("GetLeadsDetailsViewModel==>$data");
        // GetLeadsDetailResponseModel res = data;
        // print('Res==${res.id}');

        _getSApiResponse = ApiResponse.complete(data);
      } catch (e) {
        print("GetLeadsDetailsViewModel Error==>$e==");
        _getSApiResponse = ApiResponse.error(message: 'error');
      }
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
