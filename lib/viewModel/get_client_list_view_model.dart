import 'dart:async';
import 'package:agentapp/models/responseModel/get_client_list_response_model.dart';
import 'package:agentapp/repo/get_client_list_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetClientListViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  List clientList = [];
  List<People> datas = [];
  bool read = false;
  bool readTwo = false;

  changeRead(bool val) {
    read = val;
    update();
  }

  changeReadTwo(bool val) {
    readTwo = val;
    update();
  }

  bool changeStatus = false;

  changeStatusM(bool val) {
    changeStatus = val;
    update();
  }

  bool addFiled = false;

  updateFiled(bool val) {
    addFiled = val;
    update();
  }

  bool filed1 = false;

  ApiResponse get getClientListResponse => _getSApiResponse;

  Future<void> getClientListViewModel() async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    // try {
    GetClientListResponseModel response =
        await GetClientListRepo.getClientListRepo();

    response.people!.forEach((element) {
      clientList.add(element.name);
      datas.add(element);
    });
    print('NAME==${clientList}');
    _getSApiResponse = ApiResponse.complete(response);
    // } catch (e) {
    //   print("GetClientListViewModel Error==>$e==");
    //   _getSApiResponse = ApiResponse.error(message: 'error');
    // }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
