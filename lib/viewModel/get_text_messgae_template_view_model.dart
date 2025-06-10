import 'dart:async';
import 'package:agentapp/models/responseModel/get_text_message_templates_rersponse_model.dart';
import 'package:agentapp/repo/get_text_messgae_templates_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetTextMessageTemplateViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    super.onInit();
  }

  bool isShowText = false;
  showText(bool val) {
    isShowText = val;
    update();
  }

  String searchText = '';

  changeSearch(String val) {
    searchText = val;
    update();
  }

  ApiResponse get getTextMessageTemplateResponse => _getSApiResponse;

  Future<void> getTextMessageTemplateViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetTextMessageTemplatesResponseModel response =
          await GetTextMessageTemplateRepo.getTextMessageTemplateRepo();
      // print("GetTextMessageTemplateViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetTextMessageTemplateViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }

  /// Refresh status data at every 10 seconds:
}
