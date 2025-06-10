import 'dart:async';

import 'package:agentapp/models/responseModel/get_leads_timeline_response_model.dart';
import 'package:agentapp/repo/get_leads_timeline_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetLeadsTimeLineViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getLeadsTimeLineResponse => _getSApiResponse;

  Future<void> getLeadsTimeLineViewModel({String? url}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    // try {
    GetLeadsTimelineResponseModel response =
        await GetLeadsTimelineRepo.getLeadsTimelineRepo(url: url);
    print("GetLeadsTimeLineViewModel==>$response");

    _getSApiResponse = ApiResponse.complete(response);
    // } catch (e) {
    //   print("GetLeadsTimeLineViewModel Error==>$e==");
    //   _getSApiResponse = ApiResponse.error(message: 'error');
    // }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
