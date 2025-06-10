import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/controllers/uiControllers/lead_controller.dart';
import 'package:agentapp/models/responseModel/get_payment_record_response_model.dart'
    as rs;
import 'package:agentapp/screens/payments/payment_detail_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/get_payment_record_view_model.dart';
import 'package:agentapp/viewModel/store_payment_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late APIController apiController;

  late TabController tabController;

  late LeadController leadController;
  GetPaymentRecordViewModel getPaymentRecordViewModel =
      Get.put(GetPaymentRecordViewModel());
  Map<String, dynamic>? paymentDetailData;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    leadController = Get.put(LeadController());
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    super.initState();
  }

  final DateFormat formatter = DateFormat('MM/dd/yy');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      appBar: getAppBar(size),
      body: getBody(size),
    );
  }

  getAppBar(Size size) {
    print('LENGTH${StorePaymentData.storePaymentData.length}');
    return PreferredSize(
      child: MyAppBar(),
      preferredSize: Size.fromHeight(65),
    );
  }

  getBody(Size size) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          controller: getPaymentRecordViewModel.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(height: 15),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                getPaymentRecordViewModel.updateCheck();
                                Get.back();
                              },
                              child: Center(
                                child: Image.asset(
                                  'assets/images/ic_back.png',
                                  height: 31,
                                ),
                              ),
                            ),
                            horizontalSpace(),
                            Text(
                              '/Payments',
                              style: regularWhiteText12(accentColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                      ],
                    ),
                    GenericProgressBar(tag: NamedRoutes.routeChangePassword)
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Payments',
                  style: boldWhiteText24(textBlack),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GetBuilder<GetPaymentRecordViewModel>(
                builder: (controller) {
                  print(
                      'STATUS==${controller.getPaymentRecordResponse.status}');
                  if (controller.getPaymentRecordResponse.status ==
                          Status.LOADING &&
                      controller.apiCalls) {
                    return AbsorbPointer(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Center(
                          child: SpinKitFadingCircle(color: accentColor),
                        ),
                      ),
                    );
                  } else if (controller.getPaymentRecordResponse.status ==
                          Status.INITIAL &&
                      StorePaymentData.storePaymentData.isEmpty) {
                    return AbsorbPointer(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Center(
                          child: SpinKitFadingCircle(color: accentColor),
                        ),
                      ),
                    );
                  } else if (controller.getPaymentRecordResponse.status ==
                          Status.COMPLETE ||
                      !controller.apiCalls) {
                    var response = StorePaymentData.storePaymentData;
                    if (response.isEmpty) {
                      return SizedBox();
                    } else {
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView.builder(
                            itemCount: response.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  // Get.toNamed(NamedRoutes.paymentDetailScreen);
                                  Get.to(PaymentDetailScreen(
                                    detailData: response[index],
                                  ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${response[index].transactionContract!.street}',
                                                  maxLines: 1,
                                                  style: regularWhiteText19(
                                                      textBlack),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    '${response[index].transactionContract!.city} ${response[index].transactionContract!.state} ${response[index].transactionContract!.zipcode}',
                                                    style: regularWhiteText10(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        textBlack),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$${response[index].amount.toString().replaceAllMapped(reg, mathFunc)}',
                                                      style: regularWhiteText18(
                                                          textBlack),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'Date: ${formatter.format(DateTime.parse(response[index].updatedAt.toString()))}',
                                                      style: regularWhiteText13(
                                                          textBlack),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30.sp,
                                          ),
                                          response[index].status == "Paid"
                                              ? Container(
                                                  height: 34.sp,
                                                  width: 107.sp,
                                                  decoration: BoxDecoration(
                                                    color: textColor,
                                                    border: Border.all(
                                                      color: textBlack,
                                                      width: 0.7,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Paid',
                                                    style: regularWhiteText14(
                                                        textBlack,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )),
                                                )
                                              : Container(
                                                  height: 34.sp,
                                                  width: 107.sp,
                                                  decoration: BoxDecoration(
                                                    color: textBlack,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Processing',
                                                      style: regularWhiteText14(
                                                          textColor,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          getPaymentRecordViewModel.check == true
                              ? Positioned(
                                  bottom: -Get.width / 1.2,
                                  child: AbsorbPointer(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Center(
                                        child: SpinKitFadingCircle(
                                            color: accentColor),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      );
                    }
                  } else {
                    return Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    getPaymentRecordViewModel.updateCheck();
    super.dispose();
  }
}
