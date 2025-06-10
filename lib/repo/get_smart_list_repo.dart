import 'dart:developer';
import 'package:agentapp/models/responseModel/get_smart_list_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetSmartListRepo extends APIService {
  static Future<GetSmartListResponseModel> getSmartListRepo(
      {int? number}) async {
    var response = await APIService().getResponse(
      url: '${APIEndpoints.SMART_LISTS}${number.toString()}',
      apitype: APIType.aGet,
    );
    print('URl SMART==${APIEndpoints.SMART_LISTS}${number.toString()}');
    log('GetSmartListRepo===>>>  $response');
    print('DAST=${response}');

    GetSmartListResponseModel getSmartListResponseModel =
        GetSmartListResponseModel.fromJson(response);
    return getSmartListResponseModel;
  }
}
