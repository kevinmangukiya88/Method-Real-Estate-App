import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/models/responseModel/get_transaction_closed_response_model.dart';
import 'package:agentapp/models/responseModel/get_transactions_contract_response_model.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/get_pdf_link_view_model.dart';
import 'package:agentapp/viewModel/get_transaction_closed_view_model.dart';
import 'package:agentapp/viewModel/get_transactions_contracts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';
import 'transaction_detail_screen.dart';

Map<String, Map<String, dynamic>> indexMap = {};

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  var searchController = TextEditingController();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  late APIController apiController;

  late TabController tabController;
  GetPdfLinkViewModel _getPdfLinkViewModel = Get.put(GetPdfLinkViewModel());
  GetTransactionClosedViewModel _getTransactionClosedViewModel =
      Get.put(GetTransactionClosedViewModel());
  GetTransactionsContractsViewModel _getTransactionsContractsViewModel =
      Get.put(GetTransactionsContractsViewModel());
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    // if (_getTransactionsContractsViewModel.res != null) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('----Paginate');
        _getTransactionsContractsViewModel.getTransactionsContractsViewModel(
            type: 'active', isLoadings: false);
        _getTransactionClosedViewModel.getTransactionClosedViewModel(
            type: 'closed', isLoadings: false);
      }
    });
    // } else {
    //   scrollController.addListener(() {
    //     if (scrollController.position.pixels ==
    //         scrollController.position.maxScrollExtent) {
    //       print('----Paginate');
    //       _getTransactionsContractsViewModel.getTransactionsContractsViewModel(
    //           type: 'active', isLoadings: false);
    //     }
    //   });
    // }
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    // _getTransactionsContractsViewModel.getTransactionsContractsViewModel(
    //     type: 'active');
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  final NumberFormat usCurrency = NumberFormat('#,##0', 'en_US');
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

  final DateFormat formatter = DateFormat('MM/dd/yy');
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
              GetBuilder<GetTransactionsContractsViewModel>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(height: 15),
                      Row(
                        children: [
                          MyBackButton(),
                          horizontalSpace(),
                          Text(
                            '/Transactions',
                            style: regularWhiteText12(accentColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Center(
                        child: Text(
                          'Transactions',
                          style: boldWhiteText24(accentColor),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                controller.closedThisYear == null
                                    ? '0'
                                    : '${controller.closedThisYear}',
                                style: regularWhiteText40(accentColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Closed\nThis Year",
                                textAlign: TextAlign.center,
                                style: regularWhiteText16(accentColor),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                controller.ActiveContracts == null
                                    ? '0'
                                    : '${controller.ActiveContracts}',
                                style: regularWhiteText40(accentColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Active\nContracts",
                                textAlign: TextAlign.center,
                                style: regularWhiteText16(accentColor),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                controller.ClosingThisWeek == null
                                    ? '0'
                                    : '${controller.ClosingThisWeek}',
                                style: regularWhiteText40(accentColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Closing\nThis Week",
                                textAlign: TextAlign.center,
                                style: regularWhiteText16(accentColor),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
              GenericProgressBar(tag: NamedRoutes.routeChangePassword)
            ],
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Divider(),
        TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.symmetric(vertical: 5.sp),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1,
            ),
            insets: EdgeInsets.symmetric(horizontal: 50.sp),
          ),
          onTap: (int) {
            if (int == 0) {
              // _getTransactionsContractsViewModel
              //     .getTransactionsContractsViewModel(type: 'active');
              // _getTransactionsContractsViewModel.updatePage();
            } else {
              // _getTransactionsContractsViewModel
              //     .getTransactionsContractsViewModel(type: 'closed');
              _getTransactionsContractsViewModel.updatePage();
            }
          },
          tabs: [
            Text(
              "Active Contracts",
              style: regularWhiteText16(accentColor),
            ),
            Text(
              "Closed Contracts",
              style: regularWhiteText16(accentColor),
            ),
          ],
        ),
        SizedBox(
          height: 2.sp,
        ),
        Divider(),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              GetBuilder<GetTransactionsContractsViewModel>(
                builder: (controller) {
                  if (controller.getTransactionsContractsResponse.status ==
                      Status.LOADING) {
                    return AbsorbPointer(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: SpinKitFadingCircle(color: accentColor),
                        ),
                      ),
                    );
                  } else if (controller
                          .getTransactionsContractsResponse.status ==
                      Status.COMPLETE) {
                    GetTransactionsContractsResponseModel? response =
                        controller.res;
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ListView.separated(
                            controller: scrollController,
                            physics: BouncingScrollPhysics(),
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = response.data!.contracts![index];
                              return response.data!.contracts == null
                                  ? SizedBox()
                                  : ListTile(
                                      onTap: () {
                                        // Get.toNamed(
                                        //     NamedRoutes.transactionDetailScreen);
                                        Get.to(TransactionDetailScreen(
                                          data:
                                              response.data!.contracts![index],
                                        ));
                                      },
                                      dense: true,
                                      minVerticalPadding: 0,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 30.sp),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              data.street == null
                                                  ? ''
                                                  : '${data.street}',
                                              overflow: TextOverflow.ellipsis,
                                              style: regularWhiteText20(
                                                  accentColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            data.price == null
                                                ? '\$0'
                                                : '\$${data.price.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                regularWhiteText18(accentColor),
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${data.city} ${data.state} ${data.zipcode}',
                                            style:
                                                regularWhiteText10(accentColor),
                                          ),
                                          Text(
                                            'Closing: ${formatter.format(DateTime.parse(data.closingDate.toString()))}',
                                            style:
                                                regularWhiteText12(accentColor),
                                          ),
                                        ],
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: accentColor,
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.sp),
                                  child: Divider(
                                    height: 0,
                                    color: accentColor,
                                  ),
                                ),
                            itemCount: response!.data!.contracts!.length),
                        controller.isLoading == true
                            ? AbsorbPointer(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child:
                                        SpinKitFadingCircle(color: accentColor),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    );
                  } else if (controller
                          .getTransactionsContractsResponse.status ==
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
              ),
              GetBuilder<GetTransactionClosedViewModel>(
                builder: (controller) {
                  if (controller.getTransactionsClosesResponse.status ==
                      Status.LOADING) {
                    return AbsorbPointer(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: SpinKitFadingCircle(color: accentColor),
                        ),
                      ),
                    );
                  } else if (controller.getTransactionsClosesResponse.status ==
                      Status.COMPLETE) {
                    GetCloseTransactionResponseModel? response = controller.res;
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        RawScrollbar(
                          crossAxisMargin: 10,
                          thumbColor: accentColor.withOpacity(0.4),
                          thickness: 2,
                          child: ListView.separated(
                              controller: scrollController,
                              physics: BouncingScrollPhysics(),
                              // shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = response.data!.contracts![index];
                                return response.data!.contracts == null
                                    ? SizedBox()
                                    : ListTile(
                                        onTap: () {
                                          // Get.toNamed(
                                          //     NamedRoutes.transactionDetailScreen);
                                          Get.to(TransactionDetailScreen(
                                            data: response
                                                .data!.contracts![index],
                                          ));
                                          // _getPdfLinkViewModel.getLink(
                                          //     data: response
                                          //         .data!.contracts![index]);
                                        },
                                        dense: true,
                                        minVerticalPadding: 0,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sp),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data.street == null
                                                    ? ''
                                                    : '${data.street}',
                                                overflow: TextOverflow.ellipsis,
                                                style: regularWhiteText20(
                                                    accentColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              data.price == null
                                                  ? '\$0'
                                                  : '\$${data.price.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                              overflow: TextOverflow.ellipsis,
                                              style: regularWhiteText18(
                                                  accentColor),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${data.city} ${data.state} ${data.zipcode}',
                                              style: regularWhiteText10(
                                                  accentColor),
                                            ),
                                            Text(
                                              'Closing: ${formatter.format(DateTime.parse(data.closingDate.toString()))}',
                                              style: regularWhiteText12(
                                                  accentColor),
                                            ),
                                          ],
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: accentColor,
                                        ),
                                      );
                              },
                              separatorBuilder: (context, index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.sp),
                                    child: Divider(
                                      height: 0,
                                      color: accentColor,
                                    ),
                                  ),
                              itemCount: response!.data!.contracts!.length),
                        ),
                        controller.isLoading == true
                            ? AbsorbPointer(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child:
                                        SpinKitFadingCircle(color: accentColor),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    );
                  } else if (controller.getTransactionsClosesResponse.status ==
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
              ),
            ],
          ),
        )
      ],
    ));
  }
}
