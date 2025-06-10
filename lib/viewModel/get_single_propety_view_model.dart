import 'dart:async';
import 'package:agentapp/models/responseModel/get_single_property_response_model.dart';
import 'package:agentapp/repo/get_single_property_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

import 'store_payment_data.dart';

class GetSinglePropertyViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    getEventData();
    super.onInit();
  }

  getEventData() {
    for (int i = 0; i < listingData.listingId.length; i++) {
      getSinglePropertyViewModel(
          listingId: listingData.listingId[i].toString());
    }
  }

  ApiResponse get getUpdateLeadStageResponse => _getSApiResponse;

  Future<void> getSinglePropertyViewModel({String? listingId}) async {
    print('111');
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetSinglePropertyResponseModel response =
          await GetSinglePropertyRepo.getSinglePropertyRepo(
        listingId: listingId,
      );
      print("GetSinglePropertyViewModel==>$response");
      listingData.docData.add(response.response!.docs!.first);
      print('FullDATA==${listingData.docData}');
      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetSinglePropertyViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
