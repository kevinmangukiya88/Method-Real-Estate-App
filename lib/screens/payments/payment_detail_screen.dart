import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/controllers/uiControllers/lead_controller.dart';
import 'package:agentapp/models/responseModel/get_payment_record_response_model.dart'
    as re;

import 'package:agentapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class PaymentDetailScreen extends StatefulWidget {
  final re.Records? detailData;
  const PaymentDetailScreen({Key? key, this.detailData}) : super(key: key);

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  late APIController apiController;

  late LeadController leadController;

  @override
  void initState() {
    leadController = Get.put(LeadController());
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    super.initState();
    // calculatePercentage();
  }

  final DateFormat formatter = DateFormat('MM/dd/yy hh:mm');
  @override
  Widget build(BuildContext context) {
    print(
        'DD==${double.parse(widget.detailData!.transactionContract!.gci.toString().split('.').first) * double.parse(widget.detailData!.transactionContract!.commissionDeductions!.agentPercentage.toString().split('.').first) / 100}');
    print(
        'FIRST==${double.parse(widget.detailData!.transactionContract!.gci.toString().split('.').first)}');
    print(
        'SECOND==${double.parse(widget.detailData!.transactionContract!.commissionDeductions!.agentPercentage.toString().split('.').first)}');
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

  double calculatePercentage({dynamic value, dynamic total}) {
    return (value / total) * 100;
  }

  getBody(Size size) {
    return GetBuilder<LeadController>(
      builder: (controller) {
        print('STATUS==${widget.detailData!.status}');
        RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
        String Function(Match) mathFunc = (Match match) => '${match[1]},';
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                MyBackButton(),
                                horizontalSpace(),
                                Text(
                                  '/Payments/${widget.detailData!.transactionContract!.street}',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.detailData!.transactionContract!.street}',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: regularWhiteText21(textBlack),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '${widget.detailData!.transactionContract!.city} ${widget.detailData!.transactionContract!.state} ${widget.detailData!.transactionContract!.zipcode}',
                                  style: regularWhiteText15(color: textBlack),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Column(
                        children: [
                          widget.detailData!.status.toString().toLowerCase() ==
                                  "paid"
                              ? Container(
                                  height: 34.sp,
                                  width: 107.sp,
                                  decoration: BoxDecoration(
                                    color: textColor,
                                    border: Border.all(color: textBlack),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Paid',
                                    style: regularWhiteText14(textBlack,
                                        fontWeight: FontWeight.w800),
                                  )),
                                )
                              : Container(
                                  height: 34.sp,
                                  width: 107.sp,
                                  decoration: BoxDecoration(
                                    color: textBlack,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Processing',
                                      style: regularWhiteText14(textColor,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${widget.detailData!.amount.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                            style: regularWhiteText18(textBlack,
                                FontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Date: ${formatter.format(DateTime.parse('${widget.detailData!.createdAt}'))}',
                            style: regularWhiteText13(textBlack),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.detailData!.transactionContract!.gci == null
                        ? ''
                        : '\$${widget.detailData!.transactionContract!.gci.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                    style: regularWhiteText40(textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Gross Commission',
                    style: regularWhiteText18(textBlack),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ListView.builder(
                  //   itemCount: 1,
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Column(
                  //       children: [
                  //
                  //         Text(
                  //           'MLS Fee',
                  //           style: regularWhiteText18(textBlack),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                  widget.detailData!.transactionContract!.commissionDeductions!
                          .deductions!.gci!.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 60.sp,
                                ),
                                SizedBox(
                                  width: Get.width * 0.23,
                                  child: Text(
                                    'X',
                                    style: regularWhiteText40(textBlack,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.detailData!.transactionContract!.commissionDeductions!.agentPercentage.toString().split('.').first}%',
                                      style: regularWhiteText40(textBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Agent Split',
                                      style: regularWhiteText18(textBlack),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' - \$${widget.detailData!.transactionContract!.commissionDeductions!.deductions!.gci![0].amount.toString().replaceAllMapped(reg, mathFunc).toString().split('.0').first}',
                              style: regularWhiteText40(textBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                  widget.detailData!.transactionContract!.commissionDeductions!
                          .deductions!.gci!.isEmpty
                      ? SizedBox()
                      : Text(
                          'MLS Fee',
                          style: regularWhiteText18(textBlack),
                        ),
                  widget.detailData!.transactionContract!.commissionDeductions!
                              .deductions!.agentSplit!.isEmpty &&
                          widget.detailData!.transactionContract!
                              .commissionDeductions!.deductions!.gci!.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Divider(thickness: 2, color: divider),
                            ),
                            widget
                                    .detailData!
                                    .transactionContract!
                                    .commissionDeductions!
                                    .deductions!
                                    .gci!
                                    .isEmpty
                                ? Text(
                                    '\$${(double.parse(widget.detailData!.transactionContract!.gci.toString().split('.').first) * double.parse(widget.detailData!.transactionContract!.commissionDeductions!.agentPercentage.toString().split('.').first) / 100).toString().split('.').first.toString().replaceAllMapped(reg, mathFunc)}',
                                    style: regularWhiteText40(textBlack,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    '\$${widget.detailData!.transactionContract!.commissionDeductions!.netCommission.toString().replaceAllMapped(reg, mathFunc)}',
                                    style: regularWhiteText40(textBlack,
                                        fontWeight: FontWeight.w600),
                                  ),
                            Text(
                              widget
                                      .detailData!
                                      .transactionContract!
                                      .commissionDeductions!
                                      .deductions!
                                      .gci!
                                      .isEmpty
                                  ? 'Agent Gross'
                                  : 'Net Commission',
                              style: regularWhiteText18(textBlack),
                            ),
                          ],
                        ),
                  widget.detailData!.transactionContract!.commissionDeductions!
                          .deductions!.gci!.isEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget
                              .detailData!
                              .transactionContract!
                              .commissionDeductions!
                              .deductions!
                              .agentSplit!
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '- ${widget.detailData!.transactionContract!.commissionDeductions!.deductions!.agentSplit![index].amount.toString().split('.0').first}',
                                      style: regularWhiteText40(textBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${widget.detailData!.transactionContract!.commissionDeductions!.deductions!.agentSplit![index].acctName}',
                                  style: regularWhiteText18(textBlack),
                                ),
                              ],
                            );
                          },
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 60.sp,
                                ),
                                SizedBox(
                                  width: Get.width * 0.23,
                                  child: Text(
                                    'X',
                                    style: regularWhiteText40(textBlack,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.detailData!.transactionContract!.commissionDeductions!.agentPercentage.toString().split('.').first}%',
                                      style: regularWhiteText40(textBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Agent Split',
                                      style: regularWhiteText18(textBlack),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(thickness: 2, color: divider),
                  ),
                  Text(
                    '\$${widget.detailData!.transactionContract!.commissionDeductions!.agentSplit.toString().replaceAllMapped(reg, mathFunc).toString().split('.0').first}',
                    style: regularWhiteText40(textBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Paid to Agent',
                    style: regularWhiteText18(textBlack),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Details',
                    style: boldWhiteText24(textBlack),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Payment Issued:${formatDate(DateTime.parse(widget.detailData!.createdAt.toString()), format: 'MM/dd/yy')} @ ${formatDate(DateTime.parse(widget.detailData!.createdAt.toString()), format: 'hh:mm a ')}EST',
                    style: regularWhiteText15(
                        color: textBlack, weight: FontWeight.w400),
                  ),
                  Text(
                    widget.detailData!.allAgent!.bankDetail == null
                        ? 'Receipient Account Number:*****'
                        : 'Receipient Account Number: ${widget.detailData!.allAgent!.bankDetail!.accountNumber}',
                    style: regularWhiteText15(
                        color: textBlack, weight: FontWeight.w400),
                  ),
                  Text(
                    'Payment Amount: \$${widget.detailData!.transactionContract!.commissionDeductions!.agentSplit.toString().replaceAllMapped(reg, mathFunc).toString().split('.0').first}',
                    style: regularWhiteText15(
                        color: textBlack, weight: FontWeight.w400),
                  ),
                  Text(
                    'Submitted by: ${widget.detailData!.payeeName}',
                    style: regularWhiteText15(
                        color: textBlack, weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
