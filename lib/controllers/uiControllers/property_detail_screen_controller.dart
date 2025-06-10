import 'package:agentapp/custome/calender/lib/flutter_neat_and_clean_calendar.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/viewModel/request_offer_view_model.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/decorations.dart';
import '../../utils/widgets.dart';

class PropertyDetailScreenController extends GetxController {
  //posting requested offer json object should be placed here

  var isFileSelected = false.obs;

  var attachments = [].obs;
  // updateRequested() {
  //   offerRequested.value = false;
  //   update();
  // }

  List<CoolDropdownItem<String>> emHolders = [
    CoolDropdownItem<String>(label: 'Method', value: 'Method'),
    CoolDropdownItem<String>(label: 'Coop', value: 'Coop'),
    CoolDropdownItem<String>(label: 'Attorney', value: 'Attorney'),
  ];
  List<CoolDropdownItem<String>> financingTypes = [
    CoolDropdownItem<String>(label: 'FHA', value: 'FHA'),
    CoolDropdownItem<String>(label: 'VA', value: 'VA'),
    CoolDropdownItem<String>(label: 'CONV', value: 'CONV'),
    CoolDropdownItem<String>(label: 'CASH', value: 'CASH'),
  ];

  late RxList<Map<String, dynamic>> requestedOfferTerms;

  @override
  void onInit() {
    super.onInit();
  }
}
