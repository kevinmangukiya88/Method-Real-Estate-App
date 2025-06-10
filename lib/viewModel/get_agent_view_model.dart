import 'dart:async';
import 'package:agentapp/models/responseModel/get_agrents_response_model.dart';
import 'package:agentapp/models/responseModel/get_office_detail_response_model.dart';
import 'package:agentapp/repo/get_agent_repo.dart';
import 'package:agentapp/repo/get_office_detail_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetAgentViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  List OfficeService = [];
  GetAgentsResponseModel? response;
  List<dynamic> numbers = [];
  ApiResponse get getAgentResponse => _getSApiResponse;

  Future<void> getAgentViewModel({String? url}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    // try {
    response = await GetAgentRepo.getAgentRepo(url: url);
    print("GetKnowledgeSearchViewModel==>${response!.response!.docs}");

    if (response!.response!.docs == [] || response!.response!.docs!.isEmpty) {
    } else {
      for (int i = 0; i < response!.response!.docs!.length; i++) {
        numbers.add(response!.response!.docs![i].officeKeyNumeric);
      }
      await getOfficeDetailViewModel(
          url:
              '${numbers.toString().split('[').last.split(']').first.replaceAll(',', '')}');
    }

    _getSApiResponse = ApiResponse.complete(response);
    update();
  }

  ApiResponse _getApiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get getOfficeDetailResponse => _getApiResponse;

  Future<void> getOfficeDetailViewModel({String? url}) async {
    _getApiResponse = ApiResponse.loading(message: 'Loading');
    GetOfficeDetailResponseModel responsee =
        GetOfficeDetailResponseModel.fromJson(
            await GetOfficeResponse.getOfficeResponse(url: url));

    if (numbers.isNotEmpty) OfficeService.clear();
    List<dynamic> cc = [];
    responsee.response!.docs!.forEach((element) {
      cc.add(element.officeKeyNumeric);
    });
    List jj = [];
    List<int> indices = [];
    for (var element in numbers) {
      int index = cc.indexOf(element);
      if (index != -1) {
        indices.add(index);
        OfficeService.add(responsee.response!.docs![index].officeName);
        jj.add(responsee.response!.docs![index].officeName);
      } else {
        indices.add(index);
        OfficeService.add(responsee.response!.docs![index].officeName);
        jj.add(responsee.response!.docs![index].officeName);
      }
    }
    _getApiResponse = ApiResponse.complete(responsee);
    update();
  }
}
