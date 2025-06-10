import 'dart:convert';

import 'package:agentapp/utils/constants.dart';
import 'package:get/get.dart';

import '../models/baseModel/base_model.dart';
import '../utils/handlers.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class BridgeInteractiveService{

  static final BridgeInteractiveService _singleton = BridgeInteractiveService._internal();

  factory BridgeInteractiveService() {
    return _singleton;
  }

  BridgeInteractiveService._internal();

  Map<String, String> appHeaders() {
    Map<String, String> headers = {
      "accept": "*/*",
      "Content-Type": "application/json",
    };
    return headers;
  }

  Future<BaseModel> apiCallProperty(Map<String, dynamic> jsonMap, RxBool isLoading) async {
    if (await appHasInternetConnectivity()) {
      isLoading.value = true;

      logMessage(jsonMap);

      var dataset = jsonMap['dataset'];
      jsonMap.remove('dataset');

      Map<String, String> headers = appHeaders();

      var uri = Uri(
        scheme: Uri.parse(BridgeAPIEndpoints.property(dataset)).scheme,
        host: Uri.parse(BridgeAPIEndpoints.property(dataset)).host,
        path: Uri.parse(BridgeAPIEndpoints.property(dataset)).path,
        queryParameters: jsonMap
      );

      var response = await http.get(uri, headers: headers);

      isLoading.value = false;
      logMessage('${response.statusCode} ${uri.path} ${response.body}');
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        print('RESPONSE===$responseMap');
        return BaseModel.fromMap({
          'status':200,
          'code':'',
          'message':'success',
          'data':responseMap
        });

      } else {
        Handlers().apiResponseHandler(response);
        return BaseModel.fromMap(null);
      }
    } else {
      Handlers().apiResponseHandler(null, hasConnectivity: false);
      return BaseModel.fromMap(null);
    }
  }

}