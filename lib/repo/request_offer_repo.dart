import 'dart:convert';
import 'package:agentapp/controllers/uiControllers/property_detail_screen_controller.dart';
import 'package:agentapp/screens/propertyDetail/components.dart';
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/viewModel/request_offer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RequestOfferRepo extends APIService {
  static Future<bool> draftOffer(
      Map<String, dynamic> body, BuildContext? context) async {
    RequestOfferViewModel requestOfferViewModel =
        Get.put(RequestOfferViewModel());
    PropertyDetailScreenController propertyDetailScreenController =
        Get.put(PropertyDetailScreenController());
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJncm91cElkIjoxLCJpb3MiOmZhbHNlLCJpYXQiOjE2ODg1Mjk5MDR9.K3CqguDCLuWTAwX42WQp3vmvarvOFmeQF3ru4v0Tbd4',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('https://testv2api.ourmethod.com/api/projects/draft-offer'));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('===${await response.stream.bytesToString()}');
    if (response.statusCode == 200) {
      CommonWidget.getSnackBar(context!,
          message: 'Request Sent Successfully',
          duration: 2,
          colorText: Colors.white,
          color: Colors.black);
      requestOfferViewModel.changeLoading(false);
      offerRequested.value = false;
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
