import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/listing_history_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:http/http.dart' as http;

class ListingHistoryRepo extends APIService {
  static Future<ListingHistoryResponseModel> listingHistoryRepo(
      {String? url}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    var request = http.Request('GET',
        Uri.parse('http://18.209.9.132:8983/solr/fmls_Property/query?q=$url'));
    print(
        'URL==HISTORY==http://18.209.9.132:8983/solr/fmls_Property/query?q=$url');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var data = jsonDecode(await response.stream.bytesToString());

    log('${data}');
    ListingHistoryResponseModel listingHistoryResponseModel =
        ListingHistoryResponseModel.fromJson(data);
    return listingHistoryResponseModel;
  }
}
