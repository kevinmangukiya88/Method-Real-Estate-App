import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:get/get.dart';

class   GenericAPIResponse {
  static handleAPIResponse(String tag, dynamic value){
    Get.find<APIController>(tag: tag).baseModel.value = value;
  }

  GenericAPIResponse._();
}
