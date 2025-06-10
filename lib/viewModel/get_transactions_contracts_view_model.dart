import 'dart:async';
import 'package:agentapp/models/responseModel/get_transaction_closed_response_model.dart';
import 'package:agentapp/models/responseModel/get_transactions_contract_response_model.dart';
import 'package:agentapp/repo/get_transactions_contracts_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetTransactionsContractsViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

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

  GetTransactionsContractsResponseModel? res;
  ApiResponse get getTransactionsContractsResponse => _getSApiResponse;

  Future<void> getTransactionsContractsViewModel(
      {String? type, bool isLoadings = true}) async {
    updateIsLoading(true);
    if (isLoadings) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
    }

    GetTransactionsContractsResponseModel response =
        await GetTransactionsContractsRepo.getTransactionsContractsRepo(
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

    _getSApiResponse = ApiResponse.complete(response);
    updateIsLoading(false);
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
