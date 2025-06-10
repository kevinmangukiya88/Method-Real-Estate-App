import 'dart:async';
import 'package:agentapp/repo/update_device_token_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class UpdateDeviceTokenViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getUpdateDeviceTokenResponse => _getSApiResponse;

  Future<void> updateDeviceTokenViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      var response = await UpdateDeviceTokenRepo.updateDeviceTokenRepo();
      print("UpdateDeviceTokenViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("UpdateDeviceTokenViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
