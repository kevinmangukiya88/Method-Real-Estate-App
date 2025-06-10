import 'dart:developer';
import 'package:agentapp/models/responseModel/get_email_templates_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetEmailTemplatesRepo extends APIService {
  static Future<GetEmailTemplatesResponseModel>
      getLeadsAppointmentRepo() async {
    var response = await APIService().getResponse(
      url: APIEndpoints.EMAIL_TEMPLATES,
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.LEADS_DETAILS}');
    // log('GetEmailTemplatesRepo===>>>  $response');
    print('DAST=${response}');

    GetEmailTemplatesResponseModel getEmailTemplatesResponseModel =
        GetEmailTemplatesResponseModel.fromJson(response);
    return getEmailTemplatesResponseModel;
  }
}
