import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:http/http.dart' as http;

class RecentViewPropertyRepo extends APIService {
  static Future<GetAdvanceSearchPropertyResponseModel> recentViewPropertyRepo(
      {String? url}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://18.209.9.132:8983/solr/fmls_Property/query?q=ListingId:$url'));
    print('http://18.209.9.132:8983/solr/fmls_Property/query?q=ListingId:$url');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var data = jsonDecode(await response.stream.bytesToString());

    log('${data}');
    GetAdvanceSearchPropertyResponseModel
        getAdvanceSearchPropertyResponseModel =
        GetAdvanceSearchPropertyResponseModel.fromJson(data);
    return getAdvanceSearchPropertyResponseModel;
  }
}
