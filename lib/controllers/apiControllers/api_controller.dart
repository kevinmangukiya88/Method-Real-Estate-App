import 'package:agentapp/services/BridgeInteractiveService.dart';
import 'package:get/get.dart';

import '../../models/baseModel/base_model.dart';
import '../../services/web_service.dart';

class APIController extends GetxController{
  var isLoading = false.obs;
  var baseModel = BaseModel().obs;
  var webservice = Webservice();
  var bridgeInteractiveService = BridgeInteractiveService();
}