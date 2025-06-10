import 'dart:developer';
import 'package:agentapp/models/responseModel/get_text_message_templates_rersponse_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetTextMessageTemplateRepo extends APIService {
  static Future<GetTextMessageTemplatesResponseModel>
      getTextMessageTemplateRepo() async {
    var response = await APIService().getResponse(
      url: '${APIEndpoints.TEXT_MESSAGE_TEMPLATES}',
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.TEXT_MESSAGE_TEMPLATES}');
    // log('GetSmartListRepo===>>>  $response');
    print('DAST=${response}');

    GetTextMessageTemplatesResponseModel getTextMessageTemplatesResponseModel =
        GetTextMessageTemplatesResponseModel.fromJson(response);
    return getTextMessageTemplatesResponseModel;
  }
}
