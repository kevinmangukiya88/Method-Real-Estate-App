import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UpdateDeviceTokenRepo extends APIService {
  static Future updateDeviceTokenRepo() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('DEVICE TOKEN==$token');

    var response = await APIService().getResponse(
        url: APIEndpoints.UPDATE_DEVICE_TOKEN,
        apitype: APIType.aPost,
        body: {"device_token": "${token}"});
    //print("RESPONSE==>${response}");
    return response;
  }
}
