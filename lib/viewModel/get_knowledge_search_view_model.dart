import 'dart:async';
import 'package:agentapp/models/responseModel/get_knowledge_search_response_model.dart';
import 'package:agentapp/repo/get_knowledge_search_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetKnowledgeSearchViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getKnowledgeBaseResponse => _getSApiResponse;

  Future<void> getKnowledgeSearchViewModel({String? searchWord}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetKnowledgeSearchResponseModel response =
          await GetKnowledgeSearchRepo.getKnowledgeSearchRepo(
              searchWord: searchWord);
      print("GetKnowledgeSearchViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetKnowledgeSearchViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
