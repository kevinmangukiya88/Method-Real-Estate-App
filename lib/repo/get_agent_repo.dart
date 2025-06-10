import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart';
import 'package:agentapp/models/responseModel/get_agrents_response_model.dart';
import 'package:agentapp/models/responseModel/get_office_detail_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:http/http.dart' as http;

class GetAgentRepo extends APIService {
  static Future<GetAgentsResponseModel> getAgentRepo({String? url}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    var request = http.Request('GET',
        Uri.parse('http://18.209.9.132:8983/solr/fmls_Member/query?q=$url'));
    print('http://18.209.9.132:8983/solr/fmls_Member/query?q=$url');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var data = jsonDecode(await response.stream.bytesToString());

    log('${data}');
    GetAgentsResponseModel getAgentsResponseModel =
        GetAgentsResponseModel.fromJson(data);
    return getAgentsResponseModel;
  }
}
