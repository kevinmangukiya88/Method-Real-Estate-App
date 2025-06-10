import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/controllers/uiControllers/lead_controller.dart';
import 'package:agentapp/models/responseModel/get_email_templates_response_model.dart';
import 'package:agentapp/models/responseModel/get_leads_appointment_response_model.dart';
import 'package:agentapp/models/responseModel/get_leads_detail_response_model.dart';
import 'package:agentapp/models/responseModel/get_leads_stages_response_model.dart';
import 'package:agentapp/models/responseModel/get_leads_timeline_response_model.dart'
    as le;
import 'package:agentapp/models/responseModel/get_text_message_templates_rersponse_model.dart';
import 'package:agentapp/screens/propertyDetail/components.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/get_email_templates_view_model.dart';
import 'package:agentapp/viewModel/get_leads_appointment_view_model.dart';
import 'package:agentapp/viewModel/get_leads_detail_response_model.dart';
import 'package:agentapp/viewModel/get_leads_stages_view_model.dart';
import 'package:agentapp/viewModel/get_leads_timeline_view_model.dart';
import 'package:agentapp/viewModel/get_text_messgae_template_view_model.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';
import 'package:agentapp/viewModel/update_leads_stage_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart' as es;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../utils/decorations.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';
import 'package:clipboard/clipboard.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class LeadDetailScreen extends StatefulWidget {
  final String? leadId;

  const LeadDetailScreen({Key? key, this.leadId}) : super(key: key);

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen>
    with SingleTickerProviderStateMixin {
  GetLeadsDetailResponseModel? res;
  late APIController apiController;

  late TabController tabController;

  late LeadController leadController;

  GetLeadsDetailsViewModel _getLeadsDetailsViewModel =
      Get.put(GetLeadsDetailsViewModel());
  GetLeadsStagesViewModel _getLeadsStagesViewModel =
      Get.put(GetLeadsStagesViewModel());
  UpdateLeadStageViewModel _updateLeadStageViewModel =
      Get.put(UpdateLeadStageViewModel());
  GetLeadsTimeLineViewModel _getLeadsTimeLineViewModel =
      Get.put(GetLeadsTimeLineViewModel());
  GetLeadsAppointmentViewModel _getLeadsAppointmentViewModel =
      Get.put(GetLeadsAppointmentViewModel());
  GetEmailTemplatesViewModel _getEmailTemplatesViewModel =
      Get.put(GetEmailTemplatesViewModel());
  GetTextMessageTemplateViewModel _getTextMessageTemplateViewModel =
      Get.put(GetTextMessageTemplateViewModel());

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    leadController = Get.put(LeadController());
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);

    _getEmailTemplatesViewModel.getEmailTemplatesViewModel();
    _getTextMessageTemplateViewModel.getTextMessageTemplateViewModel();
    getLeads();
    getLeadsStage();
    super.initState();
  }

  List<GetLeadsStagesResponseModel> leadStage = [];

  Future<void> getLeadsStage() async {
    await _getLeadsStagesViewModel.getLeadsStagesViewModel();
    if (_getLeadsStagesViewModel.getLeadsStageResponse.status ==
        Status.COMPLETE) {
      var response = _getLeadsStagesViewModel.getLeadsStageResponse.data;
      leadStage.add(response);
    }
  }

  Map<String, dynamic>? detailData;
  getLeads() {
    if (DetailData.detailData
        .any((element) => element['id'].toString() == widget.leadId)) {
      _getLeadsDetailsViewModel.getLeadsDetailsViewModel(
          leadId: widget.leadId, apiCall: false);
      detailData = DetailData.detailData
          .singleWhere((element) => element['id'].toString() == widget.leadId);
      print('FINAL DATA==${detailData}');
    } else {
      _getLeadsDetailsViewModel.getLeadsDetailsViewModel(
          leadId: widget.leadId, apiCall: true);
    }

    if (res?.id == widget.leadId) {
      print('ALLREADY ADDED');
    } else {
      print('ADD NEW');
    }
  }

  void _showPopupMenu(GetLeadsDetailsViewModel controller) async {
    await showMenu(
      context: context,
      color: Colors.grey.shade200,
      position: RelativeRect.fromLTRB(0, 290.sp, 0, 0),
      items: List.generate(
          leadStage[0].stages!.length,
          (index) => PopupMenuItem<String>(
              child: Text('${leadStage[0].stages![index].name}'),
              value: 'Trash',
              onTap: () {
                controller.changeLeadDropDownValue(
                    '${leadStage[0].stages![index].name}');
                print('ID==${leadStage[0].stages![index].id}');
                _updateLeadStageViewModel.updateLeadStageViewModel(
                    leadStageId: leadStage[0].stages![index].id);
              }

              // => leadController.changeLeadDropDownValue('Trash'),
              )),
      elevation: 8.0,
    );
  }

  List icons = [
    "assets/images/ic_message.png",
    "assets/images/ic_mail.png",
  ];

  List messageTemplateOptions = [
    '7',
    '14',
    '5',
    'Templates',
  ];

  List emailTemplateOptions = [
    '60',
    '41',
    '51',
    'Templates',
  ];
  final DateFormat formatter = DateFormat('yMMMMd');

  String millionShow(String str) {
    var result = NumberFormat.compact(locale: 'en').format(int.parse(str));
    if (result.contains('K') && result.length > 4) {
      result = result.substring(0, result.length - 1);
      var prefix = (result.split('.').last.length) + 1;
      var temp = (double.parse(result) * .001).toStringAsFixed(prefix);
      result = double.parse(temp).toString() + 'M';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      appBar: getAppBar(size),
      body: getBody(size),
    );
  }

  getAppBar(Size size) {
    return PreferredSize(
      child: MyAppBar(),
      preferredSize: Size.fromHeight(65),
    );
  }

  getBody(Size size) {
    return GetBuilder<LeadController>(
      builder: (controller) {
        return SafeArea(
          child: GetBuilder<GetLeadsDetailsViewModel>(
            builder: (controller) {
              if (controller.getLeadsDetailResponse.status == Status.LOADING &&
                  controller.apiCalls) {
                return AbsorbPointer(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SpinKitFadingCircle(color: accentColor),
                    ),
                  ),
                );
              } else if (controller.getLeadsDetailResponse.status ==
                      Status.COMPLETE ||
                  !controller.apiCalls) {
                final leadDetails = controller.apiCalls
                    ? controller.getLeadsDetailResponse.data
                    : detailData;

                final res = leadDetails;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(height: 15),
                              Row(
                                children: [
                                  MyBackButton(),
                                  horizontalSpace(),
                                  Text(
                                    '/${res['stage']}/${res['name']}',
                                    style: regularWhiteText12(accentColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${res['firstName']}',
                                        style: boldWhiteText24(accentColor),
                                      ),
                                      SizedBox(
                                        width: 5.sp,
                                      ),
                                      Text(
                                        '${res['lastName']}',
                                        style: regularWhiteText18(accentColor),
                                      ),
                                      Spacer(),
                                      Text(
                                        res['price'] == null
                                            ? ""
                                            : '\$${millionShow(res['price'].toString())}',
                                        style: boldWhiteText24(accentColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        res['updated'] == null
                                            ? 'Last Comms'
                                            : 'Last Comms: ${formatter.format(DateTime.tryParse(res['updated'].toString())!)}',
                                        style: regularWhiteText14(accentColor),
                                      ),
                                      Text(
                                        'Marietta',
                                        style: regularWhiteText14(accentColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SweetButton(
                                        onPressed: () {
                                          _showPopupMenu(controller);
                                        },
                                        child: Container(
                                          width: 140,
                                          height: 40,
                                          decoration:
                                              rectangularAppBarBoxDecorationWithRadiusElevation(
                                                  11, 2),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: Center(
                                            child: Text(
                                              controller.leadDropDownValue == ''
                                                  ? '${res['stage']}'
                                                  : '${controller.leadDropDownValue}',
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              style: regularWhiteText14(
                                                  textColor,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          try {
                                            FlutterPhoneDirectCaller.callNumber(
                                                '${res.phones![0].value}');
                                          } catch (e) {}
                                          // makeCallActionSheet(
                                          //     mobileNo:
                                          //         '${res.phones![0].value}');
                                        },
                                        child: Image.asset(
                                          'assets/images/ic_call.png',
                                          height: 44,
                                        ),
                                      ),
                                      horizontalSpace(),
                                      Row(
                                        children: List.generate(
                                          2,
                                          (index) => InkWell(
                                            onTap: () {
                                              leadController
                                                  .changeOption(index);
                                            },
                                            child: Container(
                                              height: 44,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              width: 44,
                                              decoration: BoxDecoration(
                                                color: leadController
                                                            .optionSelected ==
                                                        index
                                                    ? accentColor
                                                    : Colors.transparent,
                                                border: Border.all(
                                                    color: leadController
                                                                .optionSelected ==
                                                            index
                                                        ? Colors.transparent
                                                        : accentColor,
                                                    width: 0.4),
                                                borderRadius:
                                                    BorderRadius.circular(4.5),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  icons[index],
                                                  height: 27,
                                                  width: 27,
                                                  color: leadController
                                                              .optionSelected ==
                                                          index
                                                      ? Colors.white
                                                      : accentColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GenericProgressBar(
                              tag: NamedRoutes.routeChangePassword)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Divider(),
                    leadController.optionSelected == -1
                        ? TabBar(
                            controller: tabController,
                            labelPadding: EdgeInsets.symmetric(vertical: 5.sp),
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              insets: EdgeInsets.symmetric(horizontal: 30.sp),
                            ),
                            onTap: (int) {
                              if (int == 1) {
                                _getLeadsTimeLineViewModel
                                    .getLeadsTimeLineViewModel(
                                        url: 'leadId=${widget.leadId}');
                              } else if (int == 2) {
                                _getLeadsTimeLineViewModel
                                    .getLeadsTimeLineViewModel(
                                        url:
                                            'exclude=note&leadId=${widget.leadId}');
                              } else if (int == 3) {
                                _getLeadsAppointmentViewModel
                                    .getLeadsAppointmentViewModel(
                                        leadId: '${widget.leadId}');
                              }
                            },
                            tabs: [
                              Text(
                                "Info",
                                style: regularWhiteText16(accentColor),
                              ),
                              Text(
                                "Comms",
                                style: regularWhiteText16(accentColor),
                              ),
                              Text(
                                "Notes",
                                style: regularWhiteText16(accentColor),
                              ),
                              Text(
                                "Activity",
                                style: regularWhiteText16(accentColor),
                              ),
                            ],
                          )
                        : SizedBox(),
                    leadController.optionSelected == -1
                        ? SizedBox(
                            height: 2.sp,
                          )
                        : SizedBox(),
                    leadController.optionSelected == -1
                        ? Divider()
                        : SizedBox(),
                    leadController.optionSelected == -1
                        ? Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                RawScrollbar(
                                  crossAxisMargin: 10,
                                  thumbColor: accentColor.withOpacity(0.4),
                                  thickness: 2,
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical: 7.sp,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: accentColor, width: 0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Contact",
                                              style: regularWhiteText14(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      phoneText(res),
                                                      text(res),
                                                      TextButton(
                                                        onPressed: () {
                                                          FlutterClipboard.copy(
                                                                  'test')
                                                              .then(
                                                            (value) => CommonWidget
                                                                .getSnackBar(
                                                                    context,
                                                                    message:
                                                                        'copied'),
                                                          );
                                                        },
                                                        child: Text(
                                                          "copy",
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Email: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      expanded(res),
                                                      TextButton(
                                                        onPressed: () {
                                                          FlutterClipboard.copy(
                                                                  'test')
                                                              .then(
                                                            (value) => CommonWidget
                                                                .getSnackBar(
                                                                    context,
                                                                    message:
                                                                        'copied'),
                                                          );
                                                        },
                                                        child: Text(
                                                          "copy",
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical: 7.sp,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: accentColor, width: 0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Background",
                                              style: regularWhiteText14(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10.sp,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${res['background']} " ??
                                                        '',
                                                    style: regularWhiteText14(
                                                      accentColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical: 7.sp,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: accentColor, width: 0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Details",
                                              style: regularWhiteText14(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Assigned Agent: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${res['assignedTo']}" ??
                                                            '',
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Source: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${res['source']}" ??
                                                            '',
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Assigned Lender: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        res['assignedLenderName'] ==
                                                                null
                                                            ? ''
                                                            : "${res['assignedLenderName']}" ??
                                                                '',
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Last Visit: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Dec 1, 2021 at 4:53pm",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical: 7.sp,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: accentColor, width: 0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Inquiries",
                                              style: regularWhiteText14(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Property Inquiry: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Realtor.com",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "12/13/22",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Text(
                                                    "123 Sample Lane Atlanta, GA 20293\nI would like more details about this property.",
                                                    style: regularWhiteText14(
                                                      accentColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.sp,
                                          vertical: 7.sp,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp,
                                          vertical: 5.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: accentColor, width: 0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Data Fields",
                                              style: regularWhiteText14(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.sp),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Login Link: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        res['customLeadQuickloginLink'] ==
                                                                null
                                                            ? ''
                                                            : "${res['customLeadQuickloginLink']}",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Last Email Open: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "December 19, 2021",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Lead Score: ",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        res['customScore'] ==
                                                                null
                                                            ? ''
                                                            : "${res['customScore']}",
                                                        style:
                                                            regularWhiteText14(
                                                          accentColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RawScrollbar(
                                    crossAxisMargin: 10,
                                    thumbColor: accentColor.withOpacity(0.4),
                                    thickness: 2,
                                    child:
                                        GetBuilder<GetLeadsTimeLineViewModel>(
                                      builder: (controllers) {
                                        if (controllers.getLeadsTimeLineResponse
                                                .status ==
                                            Status.LOADING) {
                                          return AbsorbPointer(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Center(
                                                child: SpinKitFadingCircle(
                                                    color: accentColor),
                                              ),
                                            ),
                                          );
                                        } else if (controllers
                                                .getLeadsTimeLineResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          le.GetLeadsTimelineResponseModel
                                              response = controllers
                                                  .getLeadsTimeLineResponse
                                                  .data;
                                          if (response.timelines == []) {
                                            return SizedBox();
                                          } else {
                                            return response.timelines == null
                                                ? SizedBox()
                                                : ListView.builder(
                                                    itemCount: response
                                                        .timelines?.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return response
                                                                  .timelines![
                                                                      index]
                                                                  .call ==
                                                              null
                                                          ? response
                                                                      .timelines![
                                                                          index]
                                                                      .textMessage ==
                                                                  null
                                                              ? response.timelines![index]
                                                                          .emailsDatum ==
                                                                      null
                                                                  ? SizedBox()
                                                                  : SizedBox()
                                                              : SizedBox()
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                width:
                                                                    Get.width,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5),
                                                                    border: Border.all(
                                                                        color:
                                                                            textBlack)),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  child: response
                                                                              .timelines![
                                                                                  index]
                                                                              .type ==
                                                                          'text_message'
                                                                      ? Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Container(
                                                                                        height: 20,
                                                                                        width: 20,
                                                                                        child: Image.asset(
                                                                                          'assets/images/ic_text.png',
                                                                                          fit: BoxFit.fill,
                                                                                        )),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      'Text Send',
                                                                                      style: regularWhiteText12(textBlack, fontWeight: FontWeight.w800),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      'Delivered ${formatDate(DateTime.parse(response.timelines![index].textMessage!.sent.toString()), format: 'hh:mm a')}',
                                                                                      style: regularWhiteText10(textBlack),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  '${formatDate(DateTime.parse(response.timelines![index].textMessage!.sent.toString()), format: 'MMMMd')}',
                                                                                  style: regularWhiteText12(textBlack, fontWeight: FontWeight.w400),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10.sp,
                                                                            ),
                                                                            Text('${response.timelines![index].textMessage!.message}'),
                                                                          ],
                                                                        )
                                                                      : response.timelines![index].type ==
                                                                              'email'
                                                                          ? Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                            height: 20,
                                                                                            width: 20,
                                                                                            child: Image.asset(
                                                                                              'assets/images/ic_mail.png',
                                                                                              fit: BoxFit.fill,
                                                                                            )),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        Text(
                                                                                          'Text Send',
                                                                                          style: regularWhiteText12(textBlack, fontWeight: FontWeight.w800),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        Text(
                                                                                          'Delivered 6:11 PM',
                                                                                          style: regularWhiteText10(textBlack),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      'Feb 26',
                                                                                      style: regularWhiteText12(textBlack, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 15.sp,
                                                                                ),
                                                                                Text(
                                                                                  'Subject: This property',
                                                                                  style: regularWhiteText14(textBlack),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10.sp,
                                                                                ),
                                                                                Text('Hey Sarah - Did you get the email i sent with David’s information to get your prequal?'),
                                                                              ],
                                                                            )
                                                                          : Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                            height: 20,
                                                                                            width: 20,
                                                                                            child: Image.asset(
                                                                                              'assets/images/ic_call2.png',
                                                                                              fit: BoxFit.fill,
                                                                                            )),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        Text(
                                                                                          'Phone Call Made',
                                                                                          style: regularWhiteText12(textBlack, fontWeight: FontWeight.w800),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        Text(
                                                                                          response.timelines![index].call == null ? '' : '${formatDate(DateTime.parse(response.timelines![index].updatedAt.toString()), format: 'hh:mm a ')}- by ${response.timelines![index].call!.userName ?? ''}',
                                                                                          style: regularWhiteText10(textBlack),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      '${formatDate(DateTime.parse(response.timelines![index].updatedAt.toString()), format: 'MMMMd')}',
                                                                                      style: regularWhiteText12(textBlack, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10.sp,
                                                                                ),
                                                                                Text(response.timelines![index].call == null ? '' : '${response.timelines![index].call!.note}'),
                                                                              ],
                                                                            ),
                                                                ),
                                                              ),
                                                            );
                                                    },
                                                  );
                                          }
                                        } else if (controllers
                                                .getLeadsTimeLineResponse
                                                .status ==
                                            Status.ERROR) {
                                          return Center(
                                            child: Text('Something went wrong'),
                                          );
                                        } else {
                                          return Center(
                                            child: Text('Something Went Wrong'),
                                          );
                                        }
                                      },
                                    )),
                                RawScrollbar(
                                    crossAxisMargin: 10,
                                    thumbColor: accentColor.withOpacity(0.4),
                                    thickness: 2,
                                    child:
                                        GetBuilder<GetLeadsTimeLineViewModel>(
                                      builder: (controllers) {
                                        if (controllers.getLeadsTimeLineResponse
                                                .status ==
                                            Status.LOADING) {
                                          return AbsorbPointer(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Center(
                                                child: SpinKitFadingCircle(
                                                    color: accentColor),
                                              ),
                                            ),
                                          );
                                        } else if (controllers
                                                .getLeadsTimeLineResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          le.GetLeadsTimelineResponseModel
                                              response = controllers
                                                  .getLeadsTimeLineResponse
                                                  .data;
                                          if (response.timelines == []) {
                                            return SizedBox();
                                          } else {
                                            return response.timelines == null
                                                ? SizedBox()
                                                : ListView.builder(
                                                    itemCount: response
                                                        .timelines!.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return response
                                                                  .timelines![
                                                                      index]
                                                                  .textMessage ==
                                                              null
                                                          ? SizedBox()
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                width:
                                                                    Get.width,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5),
                                                                    border: Border.all(
                                                                        color:
                                                                            textBlack)),
                                                                child: Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Container(
                                                                                    height: 20,
                                                                                    width: 20,
                                                                                    child: Image.asset(
                                                                                      'assets/images/ic_notes.png',
                                                                                      fit: BoxFit.fill,
                                                                                    )),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  'Text Send',
                                                                                  style: regularWhiteText12(textBlack, fontWeight: FontWeight.w800),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  response.timelines![index].textMessage == null ? '' : 'by ${response.timelines![index].textMessage!.userName}',
                                                                                  style: regularWhiteText10(textBlack),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Text(
                                                                              response.timelines![index].textMessage == null ? '' : '${formatDate(DateTime.parse(response.timelines![index].textMessage!.sent.toString()), format: 'MMMMd')}',
                                                                              style: regularWhiteText12(textBlack, fontWeight: FontWeight.w400),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.sp,
                                                                        ),
                                                                        Text(response.timelines![index].textMessage ==
                                                                                null
                                                                            ? ''
                                                                            : '${response.timelines![index].textMessage!.message}'),
                                                                      ],
                                                                    )),
                                                              ),
                                                            );
                                                    },
                                                  );
                                          }
                                        } else if (controllers
                                                .getLeadsTimeLineResponse
                                                .status ==
                                            Status.ERROR) {
                                          return Center(
                                            child: Text('Something went wrong'),
                                          );
                                        } else {
                                          return Center(
                                            child: Text('Something Went Wrong'),
                                          );
                                        }
                                      },
                                    )),
                                RawScrollbar(
                                    crossAxisMargin: 10,
                                    thumbColor: accentColor.withOpacity(0.4),
                                    thickness: 2,
                                    child: GetBuilder<
                                        GetLeadsAppointmentViewModel>(
                                      builder: (controllers) {
                                        if (controllers
                                                .getLeadsAppointmentResponse
                                                .status ==
                                            Status.LOADING) {
                                          return AbsorbPointer(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Center(
                                                child: SpinKitFadingCircle(
                                                    color: accentColor),
                                              ),
                                            ),
                                          );
                                        } else if (controllers
                                                .getLeadsAppointmentResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          GetLeadsAppointmentResponseModel
                                              response = controllers
                                                  .getLeadsAppointmentResponse
                                                  .data;
                                          if (response.appointments == []) {
                                            return SizedBox();
                                          } else {
                                            return ListView.builder(
                                              itemCount:
                                                  response.appointments!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: textBlack)),
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${response.appointments![index].title}',
                                                              style: regularWhiteText12(
                                                                  textBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                            Text(
                                                              '${formatDate(DateTime.parse(response.appointments![index].updated.toString()), format: 'yMMMMd')} @ ${formatDate(DateTime.parse(response.appointments![index].updated.toString()), format: 'hh:mm a ')}',
                                                              style: regularWhiteText12(
                                                                  textBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            Text(
                                                              '${response.appointments![index].description}',
                                                              style: regularWhiteText12(
                                                                  textBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        } else if (controllers
                                                .getLeadsAppointmentResponse
                                                .status ==
                                            Status.ERROR) {
                                          return Center(
                                            child: Text('Something went wrong'),
                                          );
                                        } else {
                                          return Center(
                                            child: Text('Something Went Wrong'),
                                          );
                                        }
                                      },
                                    )),
                              ],
                            ),
                          )
                        : SizedBox(),
                    leadController.optionSelected == 0
                        ? _getTextMessageTemplateViewModel.isShowText == true
                            ? Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GetBuilder<
                                          GetTextMessageTemplateViewModel>(
                                        builder: (controller) {
                                          if (controller
                                                  .getTextMessageTemplateResponse
                                                  .status ==
                                              Status.LOADING) {
                                            return AbsorbPointer(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Center(
                                                  child: SpinKitFadingCircle(
                                                      color: accentColor),
                                                ),
                                              ),
                                            );
                                          } else if (controller
                                                  .getTextMessageTemplateResponse
                                                  .status ==
                                              Status.COMPLETE) {
                                            GetTextMessageTemplatesResponseModel
                                                response = controller
                                                    .getTextMessageTemplateResponse
                                                    .data;
                                            var info =
                                                response.textmessagetemplates;

                                            if (controller
                                                .searchText.isNotEmpty) {
                                              info = info?.where((element) {
                                                return element.id!
                                                    .toString()
                                                    .toLowerCase()
                                                    .startsWith(controller
                                                        .searchText
                                                        .toLowerCase());
                                              }).toList();
                                            }
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 47.sp,
                                                        margin: EdgeInsets.only(
                                                            right: 20.sp),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  accentColor,
                                                              width: 0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.5),
                                                        ),
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.sp,
                                                                      vertical: 11
                                                                          .sp),
                                                              hintText:
                                                                  "Enter Template Number",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                          onChanged: (val) {
                                                            controller
                                                                .changeSearch(
                                                                    val);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .showText(false);
                                                        leadController
                                                            .changeMessageTemplateSelected(
                                                                1);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    30.sp,
                                                                vertical:
                                                                    10.sp),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  accentColor,
                                                              width: 0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Cancel',
                                                            style: regularWhiteText14(
                                                                accentColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3.sp,
                                                ),
                                                ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: info!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        leadController
                                                            .changeMessageTemplateSelected(
                                                                1);
                                                        controller
                                                            .showText(false);
                                                        leadController
                                                                .message.text =
                                                            "${info![index].message}";
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 10.sp,
                                                          vertical: 4.sp,
                                                        ),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                          vertical: 5.sp,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  accentColor,
                                                              width: 0.3),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "${info![index].id} ",
                                                                  style: regularWhiteText14(
                                                                      accentColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Text(
                                                                  "${info![index].name}",
                                                                  style: regularWhiteText14(
                                                                      accentColor),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10.sp,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${info[index].message}",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      regularWhiteText12(
                                                                    accentColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              ],
                                            );
                                          } else if (controller
                                                  .getTextMessageTemplateResponse
                                                  .status ==
                                              Status.ERROR) {
                                            Center(
                                                child: Text(
                                                    'Something Went Wrong'));
                                          }
                                          return Text('Something Went Wrong');
                                        },
                                      )),
                                ),
                              )
                            : Expanded(
                                child: SingleChildScrollView(child:
                                    GetBuilder<GetTextMessageTemplateViewModel>(
                                  builder: (controller) {
                                    if (controller
                                            .getTextMessageTemplateResponse
                                            .status ==
                                        Status.LOADING) {
                                      return AbsorbPointer(
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: Center(
                                            child: SpinKitFadingCircle(
                                                color: accentColor),
                                          ),
                                        ),
                                      );
                                    } else if (controller
                                            .getTextMessageTemplateResponse
                                            .status ==
                                        Status.COMPLETE) {
                                      GetTextMessageTemplatesResponseModel
                                          response = controller
                                              .getTextMessageTemplateResponse
                                              .data;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.sp),
                                            child: Row(
                                              children: [
                                                ...List.generate(
                                                  4,
                                                  (index) => InkWell(
                                                    onTap: () {
                                                      if (index == 3) {
                                                        controller
                                                            .showText(true);
                                                        leadController
                                                            .changeMessageTemplateSelected(
                                                                3);
                                                      }

                                                      leadController
                                                              .message.text =
                                                          "${response.textmessagetemplates![index].message}";
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10.sp),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30.sp,
                                                              vertical: 10.sp),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: accentColor,
                                                            width: 0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          index == 3
                                                              ? messageTemplateOptions[
                                                                  index]
                                                              : '${response.textmessagetemplates![index].id}',
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.sp,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.sp,
                                                vertical: 5.sp),
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5.sp,
                                              vertical: 5.sp,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: Border.all(
                                                  color: accentColor,
                                                  width: 0.3),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Message: ",
                                                      style: regularWhiteText14(
                                                          accentColor,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Expanded(
                                                      child: TextField(
                                                        controller:
                                                            leadController
                                                                .message,
                                                        maxLines: 5,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.sp,
                                          ),
                                          RectangleButton(
                                            text: 'Send Text',
                                            onPressed: () {
                                              if (leadController
                                                  .message.text.isEmpty) {
                                                CommonWidget.getSnackBar(
                                                    context,
                                                    message:
                                                        'Please specify recipient');
                                              } else {
                                                if (res['phones']![0]
                                                        ['value'] ==
                                                    null) {
                                                  CommonWidget.getSnackBar(
                                                      context,
                                                      message:
                                                          'No Mobile Number Available');
                                                } else {
                                                  _sendSMS(
                                                      message:
                                                          '${leadController.message.text}',
                                                      recipents: [
                                                        '${res['phones']![0]['value']}'
                                                      ]);
                                                  leadController.message
                                                      .clear();
                                                }
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    } else if (controller
                                            .getTextMessageTemplateResponse
                                            .status ==
                                        Status.ERROR) {
                                      return Center(
                                          child: Text('Something Went Wrong'));
                                    }
                                    return Center(
                                        child: Text('Something Went Wrong'));
                                  },
                                )),
                              )
                        : leadController.optionSelected != -1
                            ? _getEmailTemplatesViewModel.showEmail == true
                                ? Expanded(
                                    child: SingleChildScrollView(
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: GetBuilder<
                                              GetEmailTemplatesViewModel>(
                                            builder: (controller) {
                                              if (controller
                                                      .getEmailTemplatesResponse
                                                      .status ==
                                                  Status.LOADING) {
                                                return AbsorbPointer(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    child: Center(
                                                      child:
                                                          SpinKitFadingCircle(
                                                              color:
                                                                  accentColor),
                                                    ),
                                                  ),
                                                );
                                              } else if (controller
                                                      .getEmailTemplatesResponse
                                                      .status ==
                                                  Status.COMPLETE) {
                                                GetEmailTemplatesResponseModel
                                                    response = controller
                                                        .getEmailTemplatesResponse
                                                        .data;
                                                var info = response.templates;

                                                if (controller.searchEmailTemp
                                                    .isNotEmpty) {
                                                  info = info?.where((element) {
                                                    return element.id!
                                                        .toString()
                                                        .toLowerCase()
                                                        .startsWith(controller
                                                            .searchEmailTemp
                                                            .toLowerCase());
                                                  }).toList();
                                                }
                                                return Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 47.sp,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        20.sp),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      accentColor,
                                                                  width: 0.4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.5),
                                                            ),
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.sp,
                                                                      vertical: 11
                                                                          .sp),
                                                                  hintText:
                                                                      "Enter Template Number",
                                                                  hintStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400),
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                              onChanged: (val) {
                                                                controller
                                                                    .changeEmailTemp(
                                                                        val);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .changeShowEmail(
                                                                    false);

                                                            leadController
                                                                .changeEmailTemplateSelected(
                                                                    1);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30.sp,
                                                                    vertical:
                                                                        10.sp),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      accentColor,
                                                                  width: 0.4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.5),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Cancel',
                                                                style: regularWhiteText14(
                                                                    accentColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.sp,
                                                    ),
                                                    ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: info!.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        dom.Document document =
                                                            parser.parse(
                                                                info![index]
                                                                    .body);
                                                        String extractedText =
                                                            parser
                                                                .parse(document
                                                                    .body!.text)
                                                                .documentElement!
                                                                .text;
                                                        return GestureDetector(
                                                          onTap: () {
                                                            dom.Document
                                                                document =
                                                                parser.parse(
                                                                    info![index]
                                                                        .body);
                                                            String
                                                                extractedText =
                                                                parser
                                                                    .parse(document
                                                                        .body!
                                                                        .text)
                                                                    .documentElement!
                                                                    .text;
                                                            leadController
                                                                .changeEmailTemplateSelected(
                                                                    1);
                                                            print(
                                                                'TEXT==${extractedText}');
                                                            controller
                                                                .changeShowEmail(
                                                                    false);
                                                            leadController
                                                                    .emailSubject
                                                                    .text =
                                                                '${info[index].name}';
                                                            leadController
                                                                    .emailMessage
                                                                    .text =
                                                                "${extractedText}";
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 10.sp,
                                                              vertical: 4.sp,
                                                            ),
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                              vertical: 5.sp,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color:
                                                                      accentColor,
                                                                  width: 0.3),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "${info[index].id}. ",
                                                                      style: regularWhiteText14(
                                                                          accentColor,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${info[index].name}",
                                                                        maxLines:
                                                                            1,
                                                                        style: regularWhiteText14(
                                                                            accentColor),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10.sp,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        '${extractedText.toString().replaceAll(" ", "")}',
                                                                        maxLines:
                                                                            2,
                                                                        style:
                                                                            regularWhiteText12(
                                                                          accentColor,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  ],
                                                );
                                              } else if (controller
                                                      .getEmailTemplatesResponse
                                                      .status ==
                                                  Status.ERROR) {
                                                return Center(
                                                  child: Text(
                                                      'Something Went Wrong'),
                                                );
                                              } else {
                                                return Center(
                                                  child: Text(
                                                      'Something Went Wrong'),
                                                );
                                              }
                                            },
                                          )),
                                    ),
                                  )
                                : Expanded(
                                    child: SingleChildScrollView(child:
                                        GetBuilder<GetEmailTemplatesViewModel>(
                                      builder: (controller) {
                                        if (controller.getEmailTemplatesResponse
                                                .status ==
                                            Status.LOADING) {
                                          return AbsorbPointer(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: Center(
                                                child: SpinKitFadingCircle(
                                                    color: accentColor),
                                              ),
                                            ),
                                          );
                                        } else if (controller
                                                .getEmailTemplatesResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          GetEmailTemplatesResponseModel
                                              response = controller
                                                  .getEmailTemplatesResponse
                                                  .data;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.sp),
                                                child: Row(
                                                  children: [
                                                    ...List.generate(
                                                      4,
                                                      (index) => InkWell(
                                                        onTap: () {
                                                          if (index == 3) {
                                                            leadController
                                                                .changeEmailTemplateSelected(
                                                              1,
                                                            );
                                                            controller
                                                                .changeShowEmail(
                                                                    true);
                                                            leadController
                                                                .changeEmailTemplateSelected(
                                                              index,
                                                            );
                                                          }
                                                          dom.Document
                                                              document =
                                                              parser.parse(
                                                                  response
                                                                      .templates![
                                                                          index]
                                                                      .body);
                                                          String extractedText =
                                                              parser
                                                                  .parse(
                                                                      document
                                                                          .body!
                                                                          .text)
                                                                  .documentElement!
                                                                  .text;
                                                          leadController
                                                                  .emailSubject
                                                                  .text =
                                                              '${response.templates![index].name}';
                                                          leadController
                                                                  .emailMessage
                                                                  .text =
                                                              "${extractedText}";
                                                        },
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10.sp),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      index == 3
                                                                          ? 20
                                                                              .sp
                                                                          : 25
                                                                              .sp,
                                                                  vertical:
                                                                      10.sp),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    accentColor,
                                                                width: 0.4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.5),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              index == 3
                                                                  ? emailTemplateOptions[
                                                                      index]
                                                                  : '${response.templates![index].id}',
                                                              style: regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6.sp,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp,
                                                    vertical: 5.sp),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 5.sp,
                                                  vertical: 5.sp,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: accentColor,
                                                      width: 0.3),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "To: ",
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                leadController
                                                                    .recipients,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.sp,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp,
                                                    vertical: 5.sp),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 5.sp,
                                                  vertical: 5.sp,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: accentColor,
                                                      width: 0.3),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Subject: ",
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                leadController
                                                                    .emailSubject,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            maxLines: 1,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.sp,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp,
                                                    vertical: 5.sp),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 5.sp,
                                                  vertical: 5.sp,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: accentColor,
                                                      width: 0.3),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Message: ",
                                                          style:
                                                              regularWhiteText14(
                                                                  accentColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                leadController
                                                                    .emailMessage,
                                                            maxLines: 5,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 18.sp,
                                              ),
                                              RectangleButton(
                                                text: 'Send Email',
                                                onPressed: () async {
                                                  if (leadController.recipients
                                                      .text.isEmpty) {
                                                    CommonWidget.getSnackBar(
                                                        context,
                                                        message:
                                                            'Please specify recipient');
                                                  } else if (!RegExp(
                                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                      .hasMatch(leadController
                                                          .recipients.text)) {
                                                    CommonWidget.getSnackBar(
                                                        context,
                                                        message:
                                                            'Please specify valid recipient');
                                                  } else {
                                                    final es.Email email =
                                                        es.Email(
                                                      body: leadController
                                                          .emailMessage.text,
                                                      subject: leadController
                                                          .emailSubject.text,
                                                      cc: [],
                                                      bcc: [],
                                                      recipients: [
                                                        leadController
                                                            .recipients.text
                                                      ],
                                                      attachmentPaths: [],
                                                      isHTML: false,
                                                    );
                                                    await es.FlutterEmailSender
                                                        .send(email);
                                                    leadController.emailMessage
                                                        .clear();
                                                    leadController.emailSubject
                                                        .clear();
                                                    leadController.recipients
                                                        .clear();
                                                  }
                                                },
                                              )
                                            ],
                                          );
                                        } else if (controller
                                                .getEmailTemplatesResponse
                                                .status ==
                                            Status.ERROR) {
                                          return Center(
                                            child: Text('Something Went Wrong'),
                                          );
                                        } else {
                                          return Center(
                                            child: Text('Something Went Wrong'),
                                          );
                                        }
                                      },
                                    )),
                                  )
                            : SizedBox()
                  ],
                );
              } else if (controller.getLeadsDetailResponse.status ==
                      Status.ERROR &&
                  controller.apiCalls) {
                return Center(
                  child: Text('Something Went Wrong'),
                );
              } else {
                return Center(
                  child: Text('Something Went Wrong'),
                );
              }
            },
          ),
        );
      },
    );
  }

  Text phoneText(var res) {
    try {
      return Text(
        res['phones'] == null
            ? 'Phone '
            : "Phone: ${res['phones']![0]['value']}",
        style: regularWhiteText14(
          accentColor,
        ),
      );
    } catch (e) {
      return Text(
        'Phone ',
        style: regularWhiteText14(
          accentColor,
        ),
      );
    }
  }

  Expanded expanded(var res) {
    try {
      return Expanded(
        child: Text(
          res['emails'] != null ? "${res['emails']![0]['value']}" : '',
          style: regularWhiteText14(
            accentColor,
          ),
        ),
      );
    } catch (e) {
      return Expanded(
        child: Text(
          '',
          style: regularWhiteText14(
            accentColor,
          ),
        ),
      );
    }
  }

  Widget text(var res) {
    try {
      return Text(
        res['phones']!.first['value'] ?? "",
        style: regularWhiteText14(
          accentColor,
        ),
      );
    } finally {
      return Text(
        "",
        style: regularWhiteText14(
          accentColor,
        ),
      );
    }
  }

  /// call action sheet:
  void makeCallActionSheet({required String mobileNo}) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: <Widget>[
          Material(
            color: Colors.black.withOpacity(0.7),
            child: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(mobileNo);

                Get.back();
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 15.sp,
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15.sp,
                  ),
                  Text(
                    "Call $mobileNo",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ],
        cancelButton: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Material(
            color: Colors.black.withOpacity(0.8),
            child: CupertinoActionSheetAction(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
    );
  }

  void _sendSMS({String? message, List<String>? recipents}) async {
    String _result = await sendSMS(message: message!, recipients: recipents!)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
