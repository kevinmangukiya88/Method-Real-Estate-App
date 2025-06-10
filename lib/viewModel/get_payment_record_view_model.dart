import 'dart:async';
import 'package:agentapp/models/responseModel/get_payment_record_response_model.dart';
import 'package:agentapp/repo/get_payment_record_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_payment_data.dart';

class GetPaymentRecordViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  bool check = false;

  @override
  void onInit() {
    // if (StorePaymentData.storePaymentData.isNotEmpty) {
    check = true;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (check) {
          getPaymentRecordViewModel();
        } else {
          check = true;
        }
        update();
      }
    });
    // } else {
    //   scrollController.addListener(() {
    //     if (scrollController.position.pixels ==
    //         scrollController.position.maxScrollExtent) {
    //       // getPaymentRecordViewModel(isLoadings: false);
    //     }
    //   });
    //   check = true;
    //   update();
    // }
    super.onInit();
  }

  int currentPage = 1;

  updatePage() {
    currentPage = 1;
    update();
  }

  updateCheck() {
    check = false;
    update();
  }

  bool isLoading = false;
  updateIsLoading(bool val) {
    isLoading = val;
    update();
  }

  bool apiCalls = false;

  GetPaymentRecordResponseModel? res;

  ApiResponse get getPaymentRecordResponse => _getSApiResponse;

  Future<void> getPaymentRecordViewModel(
      {bool isLoadings = true, bool apiCall = false}) async {
    apiCalls = apiCall;
    if (isLoadings && apiCall) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
    }
    GetPaymentRecordResponseModel response =
        await GetPaymentRecordRepo.getPaymentRecordRepo(
            number: StorePaymentData.page);
    if (StorePaymentData.page == 1) {
      res = response;
      response.data!.records!.forEach((element) {
        if (!StorePaymentData.storePaymentData.contains(element)) {
          StorePaymentData.storePaymentData.add(element);
        }
      });
    } else {
      response.data!.records!.forEach((element) {
        if (!StorePaymentData.storePaymentData.contains(element)) {
          StorePaymentData.storePaymentData.add(element);
        }
      });
    }
    if (StorePaymentData.storePaymentData.isNotEmpty &&
        response.data!.records!.isNotEmpty) {
      StorePaymentData.page++;
    } else {
      updateCheck();
    }
    _getSApiResponse = ApiResponse.complete(response);
    update();
  }
}
