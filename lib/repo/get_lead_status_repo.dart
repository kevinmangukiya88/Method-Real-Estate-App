import 'package:agentapp/models/responseModel/get_lead_status_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetLeadStatusRepo extends APIService {
  static Future<GetLeadStatusResponseModel> getLeadStatusRepo(
      {String? id}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.GET_LEADS_STATUS + id!,
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.GET_LEADS_STATUS}');
    // log('GetEmailTemplatesRepo===>>>  $response');
    print('DAST=${response}');

    GetLeadStatusResponseModel getLeadStatusResponseModel =
        GetLeadStatusResponseModel.fromJson(response);
    return getLeadStatusResponseModel;
  }
}
