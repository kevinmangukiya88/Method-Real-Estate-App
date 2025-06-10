import 'package:agentapp/models/responseModel/get_client_list_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetClientListRepo extends APIService {
  static Future<GetClientListResponseModel> getClientListRepo() async {
    var response = await APIService().getResponse(
      url: APIEndpoints.CLIENT_LIST,
      apitype: APIType.aGet,
    );

    GetClientListResponseModel getClientListResponseModel =
        GetClientListResponseModel.fromJson(response);
    return getClientListResponseModel;
  }
}
