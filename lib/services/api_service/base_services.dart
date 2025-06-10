import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

enum APIType { aPost, aGet, aPut, aPatch }

class APIService {
  var response;
  var token = globalPreferences?.getString(AppPreferences.TOKEN);
  Future getResponse(
      {required String url,
      required APIType apitype,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool fileUpload = false}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    print('HEADER==${headers}');
    try {
      if (apitype == APIType.aGet) {
        final result = await http.get(Uri.parse(APIEndpoints.BASE_URL + url),
            headers: headers);
        response = returnResponse(result.statusCode, result.body);
        print('URL===${APIEndpoints.BASE_URL + url}');
        if (result.statusCode == '401') {}
        log("RES status code ${result.statusCode}");
        log("res${result.body}");
      } else if (apitype == APIType.aPut) {
        print("REQUEST PARAMETER url  $url");
        print("REQUEST PARAMETER $body");

        final result = await http.put(Uri.parse(APIEndpoints.BASE_URL + url),
            body: json.encode(body), headers: headers);
        print("resp${result.body}");
        print("URL==${APIEndpoints.BASE_URL + url}");
        response = returnResponse(result.statusCode, result.body);
        print(result.statusCode);
      } else {
        print("REQUEST PARAMETER url  $url");
        print("REQUEST PARAMETER $body");

        final result = await http.post(Uri.parse(APIEndpoints.BASE_URL + url),
            body: json.encode(body), headers: headers);
        print("resp${result.body}");
        response = returnResponse(result.statusCode, result.body);
        print(result.statusCode);
      }
    } on SocketException {
      throw FetchDataException('No Internet access');
    }
    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);
      case 401:
        print('CODE==401');

        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}
