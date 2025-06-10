import 'dart:async';
import 'package:agentapp/models/responseModel/get_knowledge_response_model.dart';
import 'package:agentapp/repo/get_knowledge_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetKnowledgeBaseViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getKnowledgeResponse => _getSApiResponse;

  Future<void> getKnowledgeBaseViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetKnowledgeResponseModel response =
          await GetKnowledgeRepo.getKnowledgeRepo();
      print("GetKnowledgeBaseViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetKnowledgeBaseViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
