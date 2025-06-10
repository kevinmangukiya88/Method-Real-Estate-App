import 'dart:async';

import 'package:agentapp/models/responseModel/get_transaction_closed_response_model.dart';
import 'package:agentapp/repo/get_transactions_closed_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetTransactionClosedViewModel extends GetxController {
  ApiResponse _getCApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  String? closedThisYear;
  String? ActiveContracts;
  String? ClosingThisWeek;
  int currentPage = 1;

  updatePage() {
    currentPage = 1;
    update();
  }

  bool isLoading = false;
  updateIsLoading(bool val) {
    isLoading = val;
    update();
  }

  GetCloseTransactionResponseModel? res;
  ApiResponse get getTransactionsClosesResponse => _getCApiResponse;

  Future<void> getTransactionClosedViewModel(
      {String? type, bool isLoadings = true}) async {
    updateIsLoading(true);
    if (isLoadings) {
      _getCApiResponse = ApiResponse.loading(message: 'Loading');
    }

    GetCloseTransactionResponseModel response =
        await GetTransactionClosedRepo.getTransactionClosedRepo(
            type: type, num: currentPage);
    closedThisYear = response.data!.totalClosed.toString();
    ActiveContracts = response.data!.totalActive.toString();
    ClosingThisWeek = response.data!.thisWeekClosing.toString();

    if (currentPage == 1) {
      res = response;
    } else {
      response.data!.contracts!.forEach((element) {
        res?.data!.contracts!.add(element);
      });
    }
    if (response.data!.contracts!.isNotEmpty) {
      currentPage++;
    }

    _getCApiResponse = ApiResponse.complete(response);
    updateIsLoading(false);
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
