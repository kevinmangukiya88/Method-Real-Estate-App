import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class ClaimLeadRepo extends APIService {
  static Future claimLeadRepo({String? id}) async {
    var response = await APIService().getResponse(
        url: APIEndpoints.CLAIM_LEADS,
        apitype: APIType.aPost,
        body: {"lead_id": "$id"});
    return response;
  }
}
