import 'dart:convert';
import 'package:agentapp/models/responseModel/get_single_property_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:http/http.dart' as http;

class GetSinglePropertyRepo extends APIService {
  static Future<GetSinglePropertyResponseModel> getSinglePropertyRepo(
      {String? listingId}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://54.167.73.0:8983/solr/fmls_Property/query?q=ListingId:$listingId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   print(response.reasonPhrase);
    // }
    var data = jsonDecode(await response.stream.bytesToString());
    GetSinglePropertyResponseModel getSinglePropertyResponseModel =
        GetSinglePropertyResponseModel.fromJson(data);
    return getSinglePropertyResponseModel;
  }
}
