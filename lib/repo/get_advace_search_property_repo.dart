import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:http/http.dart' as http;

class GetAdvanceSearchPropertyRepo extends APIService {
  static Future<GetAdvanceSearchPropertyResponseModel>
      getAdvanceSearchPropertyRepo(
          {String? url,
          int? pages,
          bool? pagination,
          String? type,
          String? sort,
          String? mslStatus}) async {
    var headers = {'Authorization': 'Basic bXBzb2xyOkR1M3NTVzVUdDlka25Dd0E='};
    if (pagination == true) {
      var request = http.Request(
          'GET',
          Uri.parse(
              'http://18.209.9.132:8983/solr/${type == null ? 'fmls' : type}_Property/query?q=${url} AND MlsStatus:${mslStatus == null ? 'Active' : mslStatus}&sort=${sort == null ? 'ModificationTimestamp desc' : sort == 'Price' ? 'ListPrice desc' : sort == 'DOM' ? 'ListingContractDate desc' : sort == 'Modified' ? 'ModificationTimestamp desc' : sort == 'Status' ? 'MlsStatus desc' : sort}&start=$pages&rows=10'));
      print(
          'URl==http://18.209.9.132:8983/solr/${type == null ? 'fmls' : type}_Property/query?q=${url} AND MlsStatus:${mslStatus == null ? 'Active' : mslStatus}&sort=${sort == null ? 'ModificationTimestamp desc' : sort == 'Price' ? 'ListPrice desc' : sort == 'DOM' ? 'ListingContractDate desc' : sort == 'Modified' ? 'ModificationTimestamp desc' : sort == 'Status' ? 'MlsStatus desc' : sort}&start=$pages&rows=10');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = jsonDecode(await response.stream.bytesToString());

      log('DATAA==${data}');
      GetAdvanceSearchPropertyResponseModel
          getAdvanceSearchPropertyResponseModel =
          GetAdvanceSearchPropertyResponseModel.fromJson(data);
      return getAdvanceSearchPropertyResponseModel;
    } else {
      var request = http.Request(
          'GET',
          Uri.parse(
              'http://18.209.9.132:8983/solr/${type == null ? 'fmls' : type}_Property/query?q=${url} AND MlsStatus:${mslStatus == null ? 'Active' : mslStatus}&sort=${sort == null ? 'ModificationTimestamp desc' : sort == 'Price' ? 'ListPrice desc' : sort == 'DOM' ? 'ListingContractDate desc' : sort == 'Modified' ? 'ModificationTimestamp desc' : sort == 'Status' ? 'MlsStatus desc' : sort}'));
      print(
          'URl==http://18.209.9.132:8983/solr/${type == null ? 'fmls' : type}_Property/query?q=${url} AND MlsStatus:${mslStatus == null ? 'Active' : mslStatus}&sort=${sort == null ? 'ModificationTimestamp desc' : sort == 'Price' ? 'ListPrice desc' : sort == 'DOM' ? 'ListingContractDate desc' : sort == 'Modified' ? 'ModificationTimestamp desc' : sort == 'Status' ? 'MlsStatus desc' : sort}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var data = jsonDecode(await response.stream.bytesToString());

      log('DATAA==${data}');
      GetAdvanceSearchPropertyResponseModel
          getAdvanceSearchPropertyResponseModel =
          GetAdvanceSearchPropertyResponseModel.fromJson(data);
      return getAdvanceSearchPropertyResponseModel;
    }
  }
}
