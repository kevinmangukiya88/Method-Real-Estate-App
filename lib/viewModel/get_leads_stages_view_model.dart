import 'dart:async';
import 'package:agentapp/models/responseModel/get_leads_stages_response_model.dart';
import 'package:agentapp/repo/get_leads_stages_response_model.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetLeadsStagesViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getLeadsStageResponse => _getSApiResponse;

  Future<void> getLeadsStagesViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetLeadsStagesResponseModel response =
          await GetLeadsStagesRepo.getLeadsStagesRepo();
      print("GetLeadsStagesViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetLeadsStagesViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
