import 'dart:developer';
import 'package:agentapp/models/responseModel/get_leads_stages_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';


class GetLeadsStagesRepo extends APIService {
  static Future<GetLeadsStagesResponseModel> getLeadsStagesRepo() async {
    var response = await APIService().getResponse(
      url: '${APIEndpoints.LEADS_STAGES}', apitype: APIType.aGet, );
    print('URl==${APIEndpoints.LEADS_STAGES}');
    log('GetLeadsDetailsRepo===>>>  $response');
    GetLeadsStagesResponseModel getLeadsStagesResponseModel =
    GetLeadsStagesResponseModel.fromJson(response);
    return getLeadsStagesResponseModel;
  }
}
