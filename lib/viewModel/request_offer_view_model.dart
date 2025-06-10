import 'dart:async';

import 'package:agentapp/controllers/uiControllers/property_detail_screen_controller.dart';
import 'package:agentapp/repo/request_offer_repo.dart';
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/viewModel/get_client_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestOfferViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    super.onInit();
  }

  PropertyDetailScreenController propertyDetailScreenController =
      Get.put(PropertyDetailScreenController());
  GetClientListViewModel _getClientListViewModel =
      Get.put(GetClientListViewModel());

  TextEditingController firstClient = TextEditingController();
  TextEditingController secondClient = TextEditingController();
  TextEditingController offerPrice = TextEditingController(text: '\$799,900');
  TextEditingController closingAttorny = TextEditingController();
  int dueDiligence = 0;
  int rightToReqRepairs = 0;
  int emDueDays = 0;
  int financeCounting = 0;
  int apprisalContingency = 0;
  String? emHolder = 'Method';
  String? financingType = 'Cash';
  String? closingDate =
      DateFormat('MMM dd yy').format(DateTime.now()).toString();
  bool sellerPropertyDisclosure = false;
  changeSellerProDis(bool val) {
    sellerPropertyDisclosure = val;
    update();
  }

  bool commmunityAssosDis = false;

  ChangeCommAsosDis(bool val) {
    commmunityAssosDis = val;
    update();
  }

  TextEditingController appraisalGap = TextEditingController(text: '\$0');
  TextEditingController address = TextEditingController();
  TextEditingController contingencyEndDate = TextEditingController();
  TextEditingController escalationBestOffersBy =
      TextEditingController(text: '\$0');
  TextEditingController escalationMaxPrice = TextEditingController(text: '\$0');
  TextEditingController dayAfterClosing = TextEditingController(text: '0');
  TextEditingController dayAfterClosingPerDay =
      TextEditingController(text: '\$0');
  TextEditingController sellerPayHomeWarranty =
      TextEditingController(text: '\$0');
  TextEditingController sellerPayClosingCost =
      TextEditingController(text: '\$0');
  bool washerDryer = false;
  bool refigerator = false;
  String? commonItemRemain;
  bool backupOffer = false;
  String? fubId;

  updateBackUpOffer(bool val) {
    backupOffer = val;
    update();
  }

  updateWasher(bool val) {
    washerDryer = val;
    update();
  }

  updateRegige(bool val) {
    refigerator = val;
    update();
  }

  TextEditingController optionFeeToSellerAmount =
      TextEditingController(text: '\$0');
  bool sellerTermiteLetter = false;
  bool sellerTermiteBond = false;

  changSellerLetter(bool val) {
    sellerTermiteLetter = val;
    update();
  }

  changeSellerBond(bool val) {
    sellerTermiteBond = val;
    update();
  }

  TextEditingController agreemTermDay = TextEditingController(text: '\$0');

  TextEditingController note = TextEditingController();
  TextEditingController earnestMoney = TextEditingController(text: '\$799,900');

  Future<void> apiCall({String? listingId, BuildContext? context}) async {
    // RequestOfferRequestModel req = RequestOfferRequestModel();
    // req.agent?.agentUid = 3;
    // req.offerData?.listingId = listingId;
    // req.offerData?.notes = note.text;
    // req.offerData?.closingDate = closingDate;
    // req.offerData?.client0LastName =
    //     firstClient.text.toString().split(' ').last;
    // req.offerData?.client0FirstName =
    //     firstClient.text.toString().split(' ').first;
    // req.offerData?.sellerOptionApplies = true;
    // req.offerData?.apprContDays = apprisalContingency;
    // req.offerData?.eMDays = emDueDays;
    // req.offerData?.tempOccPenalty =
    //     int.parse(dayAfterClosingPerDay.text.toString());
    // req.offerData?.dueDiligenceDays = dueDiligence;
    // req.offerData?.commonItemsRemain = washerDryer == true
    //     ? 'washer_dryer'
    //     : refigerator == true
    //         ? 'regigerator'
    //         : '';
    // req.offerData?.tempOccDays = int.parse(dayAfterClosingPerDay.text);
    // req.offerData?.sellerClosingCost = int.parse(sellerPayClosingCost.text);
    // req.offerData?.closingAttorneyId = '';
    // req.offerData?.escalationClauseOverage =
    //     int.parse(escalationBestOffersBy.text);
    // req.offerData?.eMAmount = int.parse(earnestMoney.text);
    // req.offerData?.buyerApprGapLimit = int.parse(appraisalGap.text);
    // req.offerData?.sellerWarrantyCost = int.parse(sellerPayHomeWarranty.text);
    // req.offerData?.clientFubId = fubId;
    // req.offerData?.backupOffer = true;
    // req.offerData?.eMHolder = emHolder;
    // req.offerData?.finContDays = financeCounting;
    // req.offerData?.sellerOptionFee = int.parse(optionFeeToSellerAmount.text);
    // req.offerData?.closingAttorneyName = closingAttorny.text;
    // req.offerData?.propertyAddress = address.text;
    // req.offerData?.sellerTermiteLetter = sellerTermiteLetter;
    // req.offerData?.sellerTermiteBond = sellerTermiteBond;
    // req.offerData?.rightRepairsDays = rightToReqRepairs;
    // req.offerData?.esclationClauseMaxPrice = escalationMaxPrice.text;
    // req.offerData?.esclationClauseOverage = escalationBestOffersBy.text;
    // req.offerData?.stipulateDislcosures = sellerPropertyDisclosure == true &&
    //         commmunityAssosDis == true
    //     ? "BOTH"
    //     : commmunityAssosDis == true && sellerPropertyDisclosure == false
    //         ? 'Community Assoc Disclosure'
    //         : sellerPropertyDisclosure == true && commmunityAssosDis == false
    //             ? "Sellers Property Disclosure"
    //             : '';
    // req.offerData?.buyerApprGap = int.parse(appraisalGap.text);

    Map<String, dynamic> bady = {
      "agent": {"agent_uid": 51},
      "offer_data": {
        "listing_id": listingId,
        "notes": note.text,
        "closing_date": closingDate,
        "client0_lastName": firstClient.text.toString().split(' ').last,
        "client0_firstName": firstClient.text.toString().split(' ').first,
        "seller_option_applies": true,
        "appr_cont_days": apprisalContingency,
        "EM_days": emDueDays,
        "temp_occ_penalty": int.parse(dayAfterClosingPerDay.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "due_diligence_days": dueDiligence,
        "common_items_remain": washerDryer == true
            ? 'washer_dryer'
            : refigerator == true
                ? 'regigerator'
                : '',
        "temp_occ_days": int.parse(dayAfterClosingPerDay.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "seller_closing_cost": int.parse(sellerPayClosingCost.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "closing_attorney_id": "",
        "escalation_clause_overage": int.parse(escalationBestOffersBy.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "EM_amount": int.parse(
            earnestMoney.text.toString().split('\$').last.replaceAll(',', '')),
        "buyer_appr_gap_limit": int.parse(
            appraisalGap.text.toString().split('\$').last.replaceAll(',', '')),
        "seller_warranty_cost": int.parse(sellerPayHomeWarranty.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "client_fub_id": fubId,
        // "backup_offer": true,
        "EM_holder": emHolder,
        "fin_cont_days": financeCounting,
        "seller_option_fee": int.parse(optionFeeToSellerAmount.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "closing_attorney_name": closingAttorny.text,
        "property_address": address.text,
        "seller_termite_letter": sellerTermiteLetter,
        "seller_termite_bond": sellerTermiteBond,
        "right_repairs_days": rightToReqRepairs,
        "escalation_clause_maxPrice": int.parse(escalationMaxPrice.text
            .toString()
            .split('\$')
            .last
            .replaceAll(',', '')),
        "financing_type": financingType,
        "esclation_clause_overage":
            escalationBestOffersBy.text.toString().split('\$').last,
        "esclation_clause_maxPrice":
            escalationMaxPrice.text.toString().split('\$').last,
        "stipulate dislcosures": sellerPropertyDisclosure == true &&
                commmunityAssosDis == true
            ? "BOTH"
            : commmunityAssosDis == true && sellerPropertyDisclosure == false
                ? 'Community Assoc Disclosure'
                : sellerPropertyDisclosure == true &&
                        commmunityAssosDis == false
                    ? "Sellers Property Disclosure"
                    : '',
        "buyer_appr_gap": int.parse(
            appraisalGap.text.toString().split('\$').last.replaceAll(',', '')),
      }
    };
    requestOfferViewModel(bady, context);
  }

  bool isLoading = false;
  changeLoading(bool val) {
    isLoading = val;

    update();
  }

  ApiResponse get requestOfferResponse => _getSApiResponse;

  Future<void> requestOfferViewModel(
      Map<String, dynamic> body, BuildContext? context) async {
    // _getSApiResponse = ApiResponse.loading(message: 'Loading');

    var response = await RequestOfferRepo.draftOffer(body, context);

    if (response == true) {
      // Future.delayed(
      //   Duration.zero,
      //   () => propertyDetailScreenController.offerRequested.value = false,
      // );
      // propertyDetailScreenController.offerRequested.value = false;
      changeLoading(false);
      offerRequested.value = false;
    } else {
      changeLoading(false);
    }

    // _getSApiResponse = ApiResponse.complete(response);

    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
