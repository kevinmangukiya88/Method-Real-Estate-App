import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/get_recent_leads_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetRecentLeadsRepo extends APIService {
  static Future<GetRecentLeadsResponseModel> getRecentLeadsRepo(
      {int? number}) async {
    var response = await APIService().getResponse(
      url: '${APIEndpoints.RECENT_LEADS}${number.toString()}',
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.RECENT_LEADS}');
    log('GetFolderListRepo===>>>  $response');
    print('DAST=${response}');

    GetRecentLeadsResponseModel getRecentLeadsResponseModel =
        GetRecentLeadsResponseModel.fromJson(response);
    return getRecentLeadsResponseModel;
  }
}
