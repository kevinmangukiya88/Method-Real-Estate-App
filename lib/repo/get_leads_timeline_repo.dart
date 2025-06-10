import 'dart:developer';
import 'package:agentapp/models/responseModel/get_leads_timeline_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';


class GetLeadsTimelineRepo extends APIService {
  static Future<GetLeadsTimelineResponseModel> getLeadsTimelineRepo({String? url}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.LEADS_TIMELINE + url! ,apitype: APIType.aGet);
    print('URl==${APIEndpoints.LEADS_TIMELINE }');
    log('GetLeadsTimelineRepo===>>>  $response');
    GetLeadsTimelineResponseModel getLeadsTimelineResponseModel =
    GetLeadsTimelineResponseModel.fromJson(response);
    return getLeadsTimelineResponseModel;
  }
}
