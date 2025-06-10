import 'dart:async';
import 'package:agentapp/models/responseModel/listing_history_response_model.dart';
import 'package:agentapp/repo/listing_history_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class ListingHistoryViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getListingHistoryResponse => _getSApiResponse;

  Future<void> listingHistoryViewModel({String? url}) async {
    print("URL==${url}");
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      ListingHistoryResponseModel response =
          await ListingHistoryRepo.listingHistoryRepo(url: url);
      print("UpdateDeviceTokenViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("ListingHistoryViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
