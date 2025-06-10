import 'dart:developer';
import 'package:agentapp/models/responseModel/get_pdf_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetPdfLinkRepo extends APIService {
  static Future<GetPdfLinkResponseModel> getPdfLinkRepo(
      {String? pdfPath}) async {
    var response = await APIService().getResponse(
      url: APIEndpoints.PDF_LINK + pdfPath!,
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.PDF_LINK}');
    log('GetLeadsDetailsRepo===>>>  $response');
    print('DAST=${response}');
    GetPdfLinkResponseModel getPdfLinkResponseModel =
        GetPdfLinkResponseModel.fromJson(response);
    return getPdfLinkResponseModel;
  }
}
