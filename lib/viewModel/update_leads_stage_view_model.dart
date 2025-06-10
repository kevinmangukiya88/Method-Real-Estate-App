import 'dart:async';
import 'package:agentapp/models/responseModel/update_leads_stages_response_model.dart';
import 'package:agentapp/repo/update_leads_stages_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class UpdateLeadStageViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getUpdateLeadStageResponse => _getSApiResponse;

  Future<void> updateLeadStageViewModel({int? leadStageId}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      UpdateLeadsStageResponseModel response =
          await UpdateLeadsStagesRepo.updateLeadsStagesRepo(
              leadStageId: leadStageId);
      print("UpdateLeadStageViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("UpdateLeadStageViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
