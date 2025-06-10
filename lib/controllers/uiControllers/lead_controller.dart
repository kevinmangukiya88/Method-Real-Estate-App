import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeadController extends GetxController {
  String leadDropDownValue = '';

  List<String> leadDropDownValueList = [
    "Trash",
    "Contact",
    "Lead",
    "Alive",
    "Engaged",
    "Buying",
  ];

  changeLeadDropDownValue(String value) {
    leadDropDownValue = value;
    update();
  }

  int optionSelected = -1;

  void changeOption(int value) {
    optionSelected = value;
    update();
  }

  int messageTemplateSelected = -1;
  TextEditingController message = TextEditingController();

  void changeMessageTemplateSelected(int value) {
    messageTemplateSelected = value;
    update();
  }

  int emailTemplateSelected = -1;
  TextEditingController emailSubject = TextEditingController();
  TextEditingController emailMessage = TextEditingController();
  TextEditingController recipients = TextEditingController();
  void changeEmailTemplateSelected(int value) {
    emailTemplateSelected = value;

    update();
  }

  bool optionVisibility = true;

  void changeOptionVisibility(bool value) {
    optionVisibility = true;
    update();
  }
}
