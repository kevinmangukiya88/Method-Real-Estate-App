import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/models/responseModel/get_pdf_response_model.dart';
import 'package:agentapp/screens/transactions/transactions_screen.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/get_pdf_link_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class TransactionDetailScreen extends StatefulWidget {
  final dynamic data;
  const TransactionDetailScreen({Key? key, this.data}) : super(key: key);

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen>
    with SingleTickerProviderStateMixin {
  var searchController = TextEditingController();

  late APIController apiController;

  late TabController tabController;

  GetPdfLinkViewModel _getPdfLinkViewModel = Get.put(GetPdfLinkViewModel());
  GetPdfLinkResponseModel? response;

  // List getPdf = [];
  // List getPdfLink = [];
  // List getThumbnailLink = [];
  // getLink() async {
  //   getPdf.clear();
  //   for (int i = 0; i < widget.data!.transactionDocuments!.length; i++) {
  //     if (widget.data!.transactionDocuments![i].fileSrc != null &&
  //         widget.data!.transactionDocuments![i].fileSrc!.isNotEmpty) {
  //       getPdf.add(widget.data!.transactionDocuments![i].fileSrc);
  //       print('getPFD==${getPdf}');
  //     }
  //   }
  //   for (int j = 0; j < getPdf.length; j++) {
  //     await _getPdfLinkViewModel.getPdfLinkViewModel(pdfPath: '${getPdf[j]}');
  //     if (_getPdfLinkViewModel.getPdfLinkResponse.status == Status.COMPLETE) {
  //       response = _getPdfLinkViewModel.getPdfLinkResponse.data;
  //       getPdfLink.add(response!.data);
  //       print('PDFLINK==${getPdfLink}');
  //       getThumbnailLink.add(
  //           '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png}');
  //       print('thumbLink===${getThumbnailLink[j]}');
  //     }
  //   }
  // }
  List getPdf = [];
  List getPdfLink = [];
  List getThumbnailLink = [];
  List getPdfName = [];
  List checkLink = [];
  List CompleteLink = [];
  List completePdfName = [];
  List dd = ['d', 'd'];

  @override
  void initState() {
    getLinkData();
    tabController = TabController(length: 3, vsync: this);
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    super.initState();
  }

  getLinkData() async {
    getPdf.clear();
    getPdfLink.clear();
    getThumbnailLink.clear();
    getPdfName.clear();
    checkLink.clear();
    for (int i = 0; i < widget.data!.transactionDocuments!.length; i++) {
      if (widget.data!.transactionDocuments![i].fileSrc != null &&
          widget.data!.transactionDocuments![i].fileSrc!.isNotEmpty) {
        getPdf.add(widget.data!.transactionDocuments![i].fileSrc.toString());
        getPdfName.add(widget.data!.transactionDocuments![i].document?.name);
      }
    }
    if (indexMap.containsKey(widget.data!.id!.toString())) {
      if (getPdf.length == indexMap['${widget.data!.id}']!['totalLink']) {
      } else {
        for (int o = 0;
            o < indexMap['${widget.data!.id}']!['thumbLink'].length;
            o++) {
          getThumbnailLink.add(indexMap['${widget.data!.id}']!['thumbLink'][o]);
        }
        for (int p = 0;
            p < indexMap['${widget.data!.id}']!['pdfLink'].length;
            p++) {
          getPdfLink.add(indexMap['${widget.data!.id}']!['pdfLink'][p]);
        }
        getPdf.forEach((element) async {
          if (indexMap['${widget.data!.id}']!['completeLink']
              .contains(element)) {
          } else {
            await _getPdfLinkViewModel.getPdfLinkViewModel(pdfPath: element);
            GetPdfLinkResponseModel dd =
                _getPdfLinkViewModel.getPdfLinkResponse.data;

            if (dd.status == 200) {
              response = _getPdfLinkViewModel.getPdfLinkResponse.data;
              CompleteLink.add(element);
              getPdfLink.add(response!.data);
              getThumbnailLink.add(
                  '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png');
              setState(() {
                indexMap['${widget.data!.id}'] = {
                  'pdfLink': getPdfLink,
                  'pdfName': getPdfName,
                  'totalLink': getPdf.length,
                  'thumbLink': getThumbnailLink,
                  'completeLink': CompleteLink
                };
              });
            }
          }
        });
      }
    } else {
      for (int j = 0; j < getPdf.length; j++) {
        await _getPdfLinkViewModel.getPdfLinkViewModel(pdfPath: getPdf[j]);
        GetPdfLinkResponseModel dd =
            _getPdfLinkViewModel.getPdfLinkResponse.data;
        if (dd.status == 200) {
          response = _getPdfLinkViewModel.getPdfLinkResponse.data;
          CompleteLink.add(getPdf[j]);
          getPdfLink.add(response!.data);
          completePdfName.add(getPdfName[j]);
          getThumbnailLink.add(
              '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png');
          setState(() {
            indexMap['${widget.data!.id}'] = {
              'pdfLink': getPdfLink,
              'pdfName': completePdfName,
              'totalLink': CompleteLink.length,
              'thumbLink': getThumbnailLink,
              'completeLink': CompleteLink
            };
          });
        }
      }
    }
  }

  List ddName = [];
  List ddImage = [];
  final DateFormat formatter = DateFormat('MM/dd/yy');
  @override
  Widget build(BuildContext context) {
    print('DATA==${widget.data?.id}');
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      appBar: getAppBar(size),
      body: getBody(size),
    );
  }

  var res;
  getAppBar(Size size) {
    return PreferredSize(
      child: MyAppBar(),
      preferredSize: Size.fromHeight(65),
    );
  }

  getBody(Size size) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return SafeArea(
      child: Column(
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
                        GestureDetector(
                          onTap: _getPdfLinkViewModel.updateBreak,
                          child: Center(
                            child: Image.asset(
                              'assets/images/ic_back.png',
                              height: 31,
                            ),
                          ),
                        ),
                        horizontalSpace(),
                        Text(
                          widget.data == null
                              ? ''
                              : '/Transactions/${widget.data!.street}',
                          style: regularWhiteText12(accentColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                  ],
                ),
                GenericProgressBar(tag: NamedRoutes.routeChangePassword)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GenericCachedNetworkImage(
                imagePath:
                    widget.data == null ? '' : '${widget.data!.propertyImg}',
                height: 85,
                width: 130,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.data == null ? '' : '${widget.data!.street} ',
                      style: regularWhiteText24(
                        accentColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      widget.data == null
                          ? ''
                          : "${widget.data!.city} ${widget.data!.state} ${widget.data!.zipcode}",
                      textAlign: TextAlign.center,
                      style: regularWhiteText10(accentColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              widget.data == null
                                  ? ''
                                  : '\$${widget.data!.price.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                              style: regularWhiteText14(accentColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Price",
                              textAlign: TextAlign.center,
                              style: regularWhiteText10(accentColor),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50.sp,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.data == null
                                  ? ''
                                  : '${formatter.format(DateTime.parse(widget.data!.closingDate.toString()))}',
                              style: regularWhiteText14(accentColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Closing Date",
                              textAlign: TextAlign.center,
                              style: regularWhiteText10(accentColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Divider(
            height: 0,
            color: accentColor,
          ),
          SizedBox(
            height: 8.sp,
          ),
          TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.symmetric(vertical: 5.sp),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1,
              ),
              insets: EdgeInsets.symmetric(horizontal: 35.sp),
            ),
            tabs: [
              Text(
                "Contacts",
                style: regularWhiteText16(accentColor),
              ),
              Text(
                "Documents",
                style: regularWhiteText16(accentColor),
              ),
              Text(
                "Details",
                style: regularWhiteText16(accentColor),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                RawScrollbar(
                  crossAxisMargin: 10,
                  thumbColor: accentColor.withOpacity(0.4),
                  thickness: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${widget.data?.closingAttorneyFirstName} ${widget.data?.closingAttorneyLastName}',
                                      style: regularWhiteText24(textBlack),
                                    ),
                                    Text(
                                      'Closing Attorney',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${widget.data?.closingAttorneyCompany}',
                                style: regularWhiteText12(textBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (widget.data
                                                      ?.closingAttorneyPhone ==
                                                  'O' ||
                                              widget.data
                                                      ?.closingAttorneyPhone ==
                                                  null) {
                                          } else {
                                            try {
                                              FlutterPhoneDirectCaller.callNumber(
                                                  '${widget.data?.closingAttorneyPhone}');
                                            } catch (e) {}
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_call2.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.closingAttorneyPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (widget.data
                                                      ?.closingAttorneyPhone ==
                                                  'O' ||
                                              widget.data
                                                      ?.closingAttorneyPhone ==
                                                  null) {
                                          } else {
                                            _sendSMS(message: '', recipents: [
                                              '${widget.data?.closingAttorneyPhone}'
                                            ]);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_message.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.closingAttorneyPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // print(
                                          //     'EMAil==${widget.data!.closingAttorneyEmail.toString()}');
                                          final Email email = Email(
                                            body: '',
                                            subject: '',
                                            cc: [],
                                            bcc: [],
                                            recipients: [
                                              widget.data!.closingAttorneyEmail
                                                  .toString()
                                            ],
                                            attachmentPaths: [],
                                            isHTML: false,
                                          );
                                          if (widget
                                                  .data?.closingAttorneyEmail ==
                                              null) {
                                          } else {
                                            await FlutterEmailSender.send(
                                                email);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_mail.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                widget.data?.closingAttorneyEmail ==
                                                        null
                                                    ? "No Email"
                                                    : 'Email',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${widget.data?.loanOfficerFirstName} ${widget.data?.loanOfficerLastName}',
                                      style: regularWhiteText24(textBlack),
                                    ),
                                    Text(
                                      'Lender',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${widget.data?.oppositePartyName}',
                                style: regularWhiteText12(textBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print(
                                              '===${widget.data?.loanOfficerPhone}');
                                          if (widget.data?.loanOfficerPhone ==
                                                  'O' ||
                                              widget.data?.loanOfficerPhone ==
                                                  null) {
                                          } else {
                                            try {
                                              FlutterPhoneDirectCaller.callNumber(
                                                  '${widget.data?.loanOfficerPhone}');
                                            } catch (e) {}
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_call2.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.loanOfficerPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (widget.data?.loanOfficerPhone ==
                                                  'O' ||
                                              widget.data?.loanOfficerPhone ==
                                                  null) {
                                          } else {
                                            _sendSMS(message: '', recipents: [
                                              '${widget.data?.loanOfficerPhone}'
                                            ]);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_message.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.loanOfficerPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Email email = Email(
                                            body: '',
                                            subject: '',
                                            cc: [],
                                            bcc: [],
                                            recipients: [
                                              widget.data!.loanOfficerEmail
                                                  .toString()
                                            ],
                                            attachmentPaths: [],
                                            isHTML: false,
                                          );
                                          if (widget.data?.loanOfficerEmail ==
                                              null) {
                                          } else {
                                            await FlutterEmailSender.send(
                                                email);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_mail.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                widget.data?.loanOfficerEmail ==
                                                        null
                                                    ? "No Email"
                                                    : 'Email',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${widget.data?.coOpFirstName} ${widget.data?.coOpLastName}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: regularWhiteText24(textBlack),
                                      ),
                                    ),
                                    Text(
                                      'Coop Agent',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${widget.data?.coOpAgentCompany}',
                                style: regularWhiteText12(textBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (widget.data?.coOpPhone == 'O' ||
                                              widget.data?.coOpPhone == null) {
                                          } else {
                                            try {
                                              FlutterPhoneDirectCaller.callNumber(
                                                  '${widget.data?.coOpPhone}');
                                            } catch (e) {}
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_call2.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.coOpPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (widget.data?.coOpPhone == 'O' ||
                                              widget.data?.coOpPhone == null) {
                                          } else {
                                            _sendSMS(message: '', recipents: [
                                              '${widget.data?.coOpPhone}'
                                            ]);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_message.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                '${widget.data?.coOpPhone}',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Email email = Email(
                                            body: '',
                                            subject: '',
                                            cc: [],
                                            bcc: [],
                                            recipients: [
                                              widget.data!.coOpEmail.toString()
                                            ],
                                            attachmentPaths: [],
                                            isHTML: false,
                                          );
                                          if (widget.data?.coOpEmail == null) {
                                          } else {
                                            await FlutterEmailSender.send(
                                                email);
                                          }
                                        },
                                        child: Container(
                                          height: 110.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textBlack),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ic_mail.png',
                                                width: 54.sp,
                                                height: 54.sp,
                                              ),
                                              Text(
                                                widget.data?.coOpEmail == null
                                                    ? "No Email"
                                                    : 'Email',
                                                style: regularWhiteText12(
                                                  textBlack,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GetBuilder<GetPdfLinkViewModel>(
                  builder: (controller) {
                    // if (controller.indexMap
                    //     .containsKey(widget.data!.id.toString())) {
                    //   print(
                    //       'LIST==${controller.indexMap['${widget.data!.id}']!['pdfLink']}');
                    //   dd =
                    //       controller.indexMap['${widget.data!.id}']!['pdfLink'];
                    //   ddName = controller
                    //       .indexMap['${widget.data!.id}']!['pdf Name'];
                    //   ddImage = controller
                    //       .indexMap['${widget.data!.id}']!['pdf Name'];
                    // } else {
                    //   print('DATA');
                    // }
                    return RawScrollbar(
                        crossAxisMargin: 10,
                        thumbColor: accentColor.withOpacity(0.4),
                        thickness: 2,
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 20),
                            child: indexMap['${widget.data!.id}'] == null
                                ? SizedBox()
                                : MasonryGridView.count(
                                    crossAxisCount: 2,
                                    itemCount: widget.data == null
                                        ? 0
                                        : indexMap['${widget.data!.id}']![
                                                'pdfLink']
                                            .length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          launchUrl(Uri.parse(
                                              '${indexMap['${widget.data!.id}']!['pdfLink'][index]}'));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 29,
                                          ),
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 124.sp,
                                                  height: 32,
                                                  child: Text(
                                                    indexMap['${widget.data!.id}']![
                                                                    'pdfName']
                                                                [index] ==
                                                            null
                                                        ? ''
                                                        : '${indexMap['${widget.data!.id}']!['pdfName'][index]}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: regularWhiteText12(
                                                        textBlack,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 162.sp,
                                                  width: 124.sp,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: textBlack)),
                                                  child:
                                                      GenericCachedNetworkImage(
                                                    imagePath:
                                                        '${indexMap['${widget.data!.id}']!['thumbLink'][index]}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )));
                  },
                ),
                RawScrollbar(
                  crossAxisMargin: 10,
                  thumbColor: accentColor.withOpacity(0.4),
                  thickness: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Important Dates',
                            style: regularWhiteText15(
                                weight: FontWeight.w600, color: textBlack),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Binding Agreement Date:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        '${formatter.format(DateTime.parse('${widget.data?.bindingDate.toString()}'))}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Due Dilligence Expires:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        widget.data!.dueDilligenceDate == null
                                            ? ''
                                            : '${formatter.format(DateTime.parse('${widget.data!.dueDilligenceDate.toString()}'))}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Finance Contingency Expires:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        widget.data?.financeContingencyDate ==
                                                null
                                            ? ''
                                            : '${formatter.format(DateTime.parse('${widget.data?.financeContingencyDate.toString()}'))}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Earnest Money',
                            style: regularWhiteText15(
                                weight: FontWeight.w600, color: textBlack),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Amount:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('\$${widget.data?.earnestMoneyAmount}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Due Date:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        widget.data?.earnestMoneyDueDate == null
                                            ? ''
                                            : '${formatter.format(DateTime.parse('${widget.data?.earnestMoneyDueDate.toString()}'))}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Holder:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${widget.data?.earnestMoneyHolder}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Closing Attorney',
                            style: regularWhiteText15(
                                weight: FontWeight.w600, color: textBlack),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Name:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${widget.data?.closingAttorneyCompany}',
                                          maxLines: 1,
                                          style: regularWhiteText14(textBlack,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Email:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${widget.data?.closingAttorneyEmail}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Phone:',
                                        style: regularWhiteText12(textBlack,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${widget.data?.closingAttorneyPhone}',
                                        style: regularWhiteText14(textBlack,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Utilities',
                            style: regularWhiteText15(
                                weight: FontWeight.w600, color: textBlack),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Electric Company:',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      widget.data?.powerCompany == null ||
                                              widget.data?.powerCompanyPhone ==
                                                  null
                                          ? ''
                                          : '${widget.data?.powerCompany} ${widget.data?.powerCompanyPhone}',
                                      style: regularWhiteText14(textBlack,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Water Company:',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      widget.data?.waterCompany == null ||
                                              widget.data?.waterCompanyPhone ==
                                                  null
                                          ? ''
                                          : '${widget.data?.waterCompany} ${widget.data?.waterCompanyPhone}',
                                      style: regularWhiteText14(textBlack,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Sanitation Company:',
                                      style: regularWhiteText12(textBlack,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      widget.data?.sanitationCompany == null ||
                                              widget.data
                                                      ?.sanitationCompanyPhone ==
                                                  null
                                          ? ''
                                          : '${widget.data?.sanitationCompany} ${widget.data?.sanitationCompanyPhone}',
                                      style: regularWhiteText14(textBlack,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
