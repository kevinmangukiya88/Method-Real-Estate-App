import 'package:agentapp/models/responseModel/get_knowledge_search_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetKnowledgeSearchRepo extends APIService {
  static Future<GetKnowledgeSearchResponseModel> getKnowledgeSearchRepo(
      {String? searchWord}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.KNOWLEDGE_SEARCH + searchWord!,
      apitype: APIType.aGet,
    );
    print('GetKnowledgeSearchRepoURl==${APIEndpoints.LEADS_DETAILS}');
    print('GetKnowledgeSearchRepo res=${response}');
    GetKnowledgeSearchResponseModel getKnowledgeSearchResponseModel =
        GetKnowledgeSearchResponseModel.fromJson(response);
    return getKnowledgeSearchResponseModel;
  }
}
