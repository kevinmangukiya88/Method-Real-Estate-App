import 'dart:async';
import 'package:agentapp/models/responseModel/get_email_templates_response_model.dart';
import 'package:agentapp/repo/get_email_templates_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetEmailTemplatesViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  bool showEmail = false;

  changeShowEmail(bool val) {
    showEmail = val;
    update();
  }

  String searchEmailTemp = '';
  changeEmailTemp(String val) {
    searchEmailTemp = val;
    update();
  }

  ApiResponse get getEmailTemplatesResponse => _getSApiResponse;

  Future<void> getEmailTemplatesViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetEmailTemplatesResponseModel response =
          await GetEmailTemplatesRepo.getLeadsAppointmentRepo();
      // print("GetEmailTemplatesViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetEmailTemplatesViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
