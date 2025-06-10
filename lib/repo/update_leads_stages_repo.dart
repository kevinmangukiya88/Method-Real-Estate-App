import 'dart:developer';
import 'package:agentapp/models/responseModel/update_leads_stages_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';


  class UpdateLeadsStagesRepo extends APIService {
  static Future<UpdateLeadsStageResponseModel> updateLeadsStagesRepo({int? leadStageId}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.UPDATE_LEADS_STAGES + leadStageId.toString(), apitype: APIType.aPut, );
    print('URl==${APIEndpoints.UPDATE_LEADS_STAGES}');
    log('UpdateLeadsStagesRepo===>>>  $response');
    UpdateLeadsStageResponseModel updateLeadsStageResponseModel =
    UpdateLeadsStageResponseModel.fromJson(response);
    return updateLeadsStageResponseModel;
  }
}
