import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:agentapp/models/responseModel/get_office_detail_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';

class GetOfficeResponse extends APIService {
  static Future getOfficeResponse({String? url}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://18.209.9.132:8983/solr/fmls_Office/query?q=OfficeKeyNumeric:($url)'));
    print(
        'http://18.209.9.132:8983/solr/fmls_Office/query?q=OfficeKeyNumeric:($url)');

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var data = jsonDecode(await response.stream.bytesToString());

    log('====${data}');

    return data;
  }
}
