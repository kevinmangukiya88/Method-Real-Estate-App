import 'dart:async';
import 'package:agentapp/repo/get_leads_appointment_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';
import 'package:agentapp/models/responseModel/get_leads_appointment_response_model.dart';

class GetLeadsAppointmentViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getLeadsAppointmentResponse => _getSApiResponse;

  Future<void> getLeadsAppointmentViewModel({String? leadId}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetLeadsAppointmentResponseModel response =
          await GetLeadsAppointmentRepo.getLeadsAppointmentRepo(leadId: leadId);
      print("GetLeadsAppointmentResponseModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetLeadsAppointmentResponseModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
