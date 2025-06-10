import 'dart:developer';
import 'package:agentapp/models/responseModel/get_leads_appointment_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetLeadsAppointmentRepo extends APIService {
  static Future<GetLeadsAppointmentResponseModel> getLeadsAppointmentRepo(
      {String? leadId}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.LEADS_APPOINTMENT + leadId!,
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.LEADS_DETAILS}');
    log('GetLeadsDetailsRepo===>>>  $response');
    print('DAST=${response}');

    GetLeadsAppointmentResponseModel getLeadsAppointmentResponseModel =
        GetLeadsAppointmentResponseModel.fromJson(response);
    return getLeadsAppointmentResponseModel;
  }
}
