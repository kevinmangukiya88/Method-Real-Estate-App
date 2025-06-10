import 'package:agentapp/main.dart';
import 'package:agentapp/models/responseModel/get_lead_status_response_model.dart';
import 'package:agentapp/repo/claim_lead_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/viewModel/get_lead_status_view_model.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

RxBool isBottomSheetOpen = false.obs;

appModalBottomSheet({
  Map<String, dynamic>? data,
}) async {
  GetLeadStatusViewModel _getLeadStatusViewModel =
      Get.put(GetLeadStatusViewModel());
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  Get.bottomSheet(
    backgroundColor: Color(0xffF0F0F0),
    shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    isScrollControlled: true,
    isDismissible: true,
    SizedBox(
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: GetBuilder<GetLeadStatusViewModel>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5,
                    width: 103,
                    decoration: BoxDecoration(
                      color: deleteFieldColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'New Lead',
                    style: boldWhiteText24(textBlack),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Name: ',
                      style: boldWhiteText20(textBlack),
                    ),
                    Text(
                      data?['firstName'] == null || data?['lastName'] == null
                          ? ''
                          : '${data?['firstName']} ${data?['lastName']}',
                      style: regularWhiteText16(textBlack),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Price: ',
                      style: boldWhiteText20(textBlack),
                    ),
                    Text(
                      data?['price'] == null
                          ? ''
                          : '\$${data?['price'].toString().replaceAllMapped(reg, mathFunc)}',
                      style: regularWhiteText16(textBlack),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  data?['message'] == null ? 'Area/Price:' : 'Area/Property: ',
                  style: boldWhiteText20(textBlack),
                ),
                Text(
                  data?['message'] == null
                      ? "${data?['mostRecentSearch']}"
                      : data?['address'] == null
                          ? "${data?['mostRecentSearch']}"
                          : '${data?['address']}',
                  style: regularWhiteText16(textBlack),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Comments/Info:',
                  style: boldWhiteText20(textBlack),
                ),
                Text(
                  data?['message'] == null
                      ? ''
                      : 'Comments: ${data?['message'].toString().split('Comments:').last}',
                  style: regularWhiteText16(textBlack),
                ),
                SizedBox(
                  height: 50,
                ),
                Obx(
                  () => loading.value == true && isClaimed.value == false
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            height: 46,
                            width: Get.width,
                            child: AbsorbPointer(
                              child: Container(
                                width: Get.width,
                                height: Get.height,
                                child: Center(
                                  child:
                                      SpinKitFadingCircle(color: accentColor),
                                ),
                              ),
                            ),
                          ),
                        )
                      : isClaimed.value == true && loading.value == false
                          ? Align(
                              alignment: Alignment.center,
                              child: Text('Lead has been claimed',
                                  style: boldWhiteText20(textBlack)))
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (data!['id'] == null) {
                                  } else {
                                    DetailData.timer?.cancel();

                                    DetailData.timer = null;
                                    controller.setLoading(true);
                                    await ClaimLeadRepo.claimLeadRepo(
                                        id: data['id']);
                                    controller.getLeadStatusViewModel(
                                        leadId: data['id']);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Claim Lead",
                                        style: regularWhiteText22(textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: OutlinedButton(
                    onPressed: () {
                      try {
                        DetailData.timer!.cancel();
                      } catch (e) {}
                      try {
                        DetailData.timer = null;
                      } catch (e) {}
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: accentColor)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dismiss",
                            style: regularWhiteText22(accentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55.sp,
                ),
              ],
            );
          },
        ),
      ),
    ),
  ).whenComplete(() async {
    DetailData.timer?.cancel();
    DetailData.timer = null;
    isBottomSheetOpen.value = false;
    notificationData = {};
  });
  await _getLeadStatusViewModel.getLeadStatusViewModel(leadId: data?['id']);
  if (_getLeadStatusViewModel.getLeadsStatusResponse.status ==
      Status.COMPLETE) {
    GetLeadStatusResponseModel response =
        _getLeadStatusViewModel.getLeadsStatusResponse.data;
    if (response.claimed == false) {
      DetailData.setUpTimedFetch(leadId: data?['id']);
    }
  }
}
