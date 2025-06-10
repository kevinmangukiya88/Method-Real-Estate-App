import 'dart:async';
import 'package:agentapp/main.dart';
import 'package:agentapp/viewModel/get_lead_status_view_model.dart';
import 'package:get/get.dart';

class DetailData {
  static List<Map<String, dynamic>> detailData = [];
  static Timer? timer;
  static GetLeadStatusViewModel getLeadStatusViewModel =
      Get.put(GetLeadStatusViewModel());
  static setUpTimedFetch({String? leadId}) {
    if (isClaimed == true) {
      timer?.cancel();
      timer = null;
    } else {
      timer = Timer.periodic(Duration(seconds: 1), (value) async {
        print('DATASSS');
        await GetLeadStatusViewModel().getLeadStatusViewModel(leadId: leadId);
      });
    }
  }
}
