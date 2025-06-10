import 'package:agentapp/models/responseModel/get_knowledge_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetKnowledgeRepo extends APIService {
  static Future<GetKnowledgeResponseModel> getKnowledgeRepo() async {
    var response = await APIService().getResponse(
      url: APIEndpoints.KNOWLEDGE,
      apitype: APIType.aGet,
    );
    print('GetKnowledgeRepo URl==${APIEndpoints.LEADS_DETAILS}');
    print('GetKnowledgeRepo res=${response}');
    GetKnowledgeResponseModel getKnowledgeResponseModel =
        GetKnowledgeResponseModel.fromJson(response);
    return getKnowledgeResponseModel;
  }
}
