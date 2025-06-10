import 'dart:developer';
import 'package:agentapp/models/responseModel/get_leads_detail_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';

class GetLeadsDetailsRepo extends APIService {
  static Future getLeadsDetailsRepo({String? leadId}) async {
    // List<Map<String,dynamic>> detailData=[];
    var response = await APIService().getResponse(
      url: '${APIEndpoints.LEADS_DETAILS}$leadId',
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.LEADS_DETAILS}$leadId');
    log('GetLeadsDetailsRepo===>>>  $response');
    print('DAST=${response}');
    DetailData.detailData.add(response);
    // GetLeadsDetailResponseModel res =
    //     GetLeadsDetailResponseModel.fromJson(response);
    // print('res==${res}');
    return response;
  }
}
