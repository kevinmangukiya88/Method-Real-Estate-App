import 'dart:async';
import 'package:agentapp/screens/searchResults/search_result_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:agentapp/viewModel/get_agent_lookup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'agent_map_screen.dart';

class AgentDetailScreen extends StatefulWidget {
  final String? firstname;
  final String? lastName;
  final String? mlsId;
  final String? officeName;
  final String? officeMlsId;
  const AgentDetailScreen(
      {Key? key,
      this.firstname,
      this.lastName,
      this.mlsId,
      this.officeName,
      this.officeMlsId})
      : super(key: key);

  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());
  GetAgentLookupViewModel _getAgentLookupViewModel =
      Get.put(GetAgentLookupViewModel());
  DateTime date = DateTime.now().subtract(Duration(days: 365));
  var threeYearDate = DateTime.now().subtract(Duration(days: 1095));

  @override
  void initState() {
    print('DATE==${date.toIso8601String()}');
    _getAgentLookupViewModel.markers.clear();
    _getAgentLookupViewModel.cordinates.clear();
    _getAgentLookupViewModel.updateSalesPrice('0');

    _getAgentLookupViewModel.getAgentLookupViewModel(
        url:
            '((ListAgentMlsId:"${widget.mlsId}" OR CoListAgentMlsId:"${widget.mlsId}") OR (BuyerAgentMlsId:"${widget.mlsId}" OR CoBuyerAgentMlsId:"${widget.mlsId}"))AND MlsStatus:Closed&top=150');
    _getAgentLookupViewModel.getPendingViewModel(
        url:
            '((ListAgentMlsId:"${widget.mlsId}" OR CoListAgentMlsId:"${widget.mlsId}") OR (BuyerAgentMlsId:"${widget.mlsId}" OR CoBuyerAgentMlsId:"${widget.mlsId}"))&fq=(MlsStatus:"Active Under Contract" OR MlsStatus:"Pending") &top=150');
    _getAgentLookupViewModel.getCloseMonthViewModel(
        url:
            '((ListAgentMlsId:"${widget.mlsId}" OR CoListAgentMlsId:"${widget.mlsId}") OR (BuyerAgentMlsId:"${widget.mlsId}" OR CoBuyerAgentMlsId:"${widget.mlsId}")) AND MlsStatus:Closed AND CloseDate:[${date.toIso8601String()} TO *] &rows=150');

    _getAgentLookupViewModel.getAvgSalesPriceViewModel(
      url:
          '(BuyerAgentMlsId:"${widget.mlsId}" OR CoBuyerAgentMlsId:"${widget.mlsId}") AND MlsStatus:"Closed"&sort=CloseDate desc&top=150',
    );
    _getAgentLookupViewModel.getAvgListPriceViewModel(
        url:
            '(ListAgentMlsId:"${widget.mlsId}" OR CoListAgentMlsId:"${widget.mlsId}") AND MlsStatus:"Closed"&sort=CloseDate desc&start=0');
    _getAgentLookupViewModel.getMapSalesViewModel(
        url:
            '(BuyerAgentMlsId:"${widget.mlsId}" OR CoBuyerAgentMlsId:"${widget.mlsId}") AND MlsStatus:"Closed"&sort=CloseDate desc &top=150',
        secondUrl:
            '(ListAgentMlsId:"${widget.mlsId}" OR CoListAgentMlsId:"${widget.mlsId}") AND MlsStatus:"Closed"&sort=CloseDate desc&start=0');

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
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
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return SafeArea(child: SingleChildScrollView(
      child: GetBuilder<GetAgentLookupViewModel>(
        builder: (controller) {
          print('controller.markers==${controller.markers}');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(height: 15),
                    Row(
                      children: [
                        MyBackButton(),
                        horizontalSpace(),
                        Text(
                          '/Agent Lookup/',
                          style: regularWhiteText12(accentColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Center(
                      child: Text(
                        'Agent Details',
                        style: boldWhiteText24(accentColor),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.firstname}',
                      style: boldWhiteText24(textBlack),
                    ),
                    Text(
                      '${widget.lastName}',
                      style: regularWhiteText18(textBlack),
                    ),
                    Text(
                      '${widget.officeName} -${widget.officeMlsId}',
                      style: regularWhiteText15(color: textBlack),
                    ),
                    Divider(color: textBlack),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${controller.lastMonthDate}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'closed Last 12 Mo',
                                textAlign: TextAlign.center,
                                style: regularWhiteText16(textBlack),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${controller.avgSalesPrice}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'Avg Sales Price (12mo)',
                                textAlign: TextAlign.center,
                                style: regularWhiteText13(textBlack),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22.sp,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${controller.pending}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'Pending Contracts',
                                textAlign: TextAlign.center,
                                style: regularWhiteText16(textBlack),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${controller.avgListPrice}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'Avg List Price (12mo)',
                                textAlign: TextAlign.center,
                                style: regularWhiteText13(textBlack),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22.sp,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${controller.lifeTimeSales}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'Lifetime Sales',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: regularWhiteText16(textBlack),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${controller.millionShow(controller.totalSale.toString())}',
                                style: boldWhiteText40(textBlack),
                              ),
                              Text(
                                'Total Volume (12mo)',
                                textAlign: TextAlign.center,
                                style: regularWhiteText13(textBlack),
                              ),
                            ],
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
              AgentMapView(
                  firstname: widget.firstname, lastName: widget.lastName),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Legend:',
                    style: regularWhiteText16(textBlack),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '0-12 Mo',
                        style: regularWhiteText12(textColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: textBlack),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '12-24 Mo',
                        style: regularWhiteText12(textBlack),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(0xffB8BCBF),
                        border: Border.all(color: divider),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '12-24 Mo',
                        style: regularWhiteText12(textColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              ListTile(
                onTap: () {
                  _getAdvanceSearchPropertyViewModel.setShowAllFilter(false);
                  _getAdvanceSearchPropertyViewModel.checkAgentLookUp(true);
                  _getAdvanceSearchPropertyViewModel.updateStatus('Closed');

                  _getAdvanceSearchPropertyViewModel.statusChoiceChips[1]
                      ['isSelected'] = true;

                  Get.to(SearchResultScreen(
                    url:
                        'ListAgentMlsId:${widget.mlsId}&orderby=CloseDate desc',
                    pag: true,
                    pagination: true,
                    aroundMe: false,
                  ));
                  _getAdvanceSearchPropertyViewModel.res?.response?.docs = [];
                  _getAdvanceSearchPropertyViewModel.currentPage = 1;
                  _getAdvanceSearchPropertyViewModel.updateString(true);
                  _getAdvanceSearchPropertyViewModel.setSingleUrl(
                    val:
                        'ListAgentMlsId:${widget.mlsId}&orderby=CloseDate desc',
                  );
                  _getAdvanceSearchPropertyViewModel
                      .getAdvanceSearchPropertyViewModel(
                    url:
                        'ListAgentMlsId:${widget.mlsId}&orderby=CloseDate desc',
                    pagination: true,
                  );
                },
                dense: true,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 30.sp),
                title: Text(
                  'View Closed Listing',
                  overflow: TextOverflow.ellipsis,
                  style: regularWhiteText20(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Divider(
                  height: 0,
                  color: accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  _getAdvanceSearchPropertyViewModel.setShowAllFilter(false);
                  _getAdvanceSearchPropertyViewModel.checkAgentLookUp(true);
                  _getAdvanceSearchPropertyViewModel.updateStatus('Pending');

                  _getAdvanceSearchPropertyViewModel.statusChoiceChips[2]
                      ['isSelected'] = true;

                  Get.to(SearchResultScreen(
                    url: 'ListAgentMlsId:${widget.mlsId}',
                    pag: true,
                    pagination: true,
                    aroundMe: false,
                  ));
                  _getAdvanceSearchPropertyViewModel.res?.response?.docs = [];
                  _getAdvanceSearchPropertyViewModel.currentPage = 1;
                  _getAdvanceSearchPropertyViewModel.updateString(true);
                  _getAdvanceSearchPropertyViewModel.setSingleUrl(
                    val: 'ListAgentMlsId:${widget.mlsId}',
                  );
                  _getAdvanceSearchPropertyViewModel
                      .getAdvanceSearchPropertyViewModel(
                    url: 'ListAgentMlsId:${widget.mlsId}',
                    pagination: true,
                  );
                },
                dense: true,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 30.sp),
                title: Text(
                  'View Pending Listing',
                  overflow: TextOverflow.ellipsis,
                  style: regularWhiteText20(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Divider(
                  height: 0,
                  color: accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  _getAdvanceSearchPropertyViewModel.setShowAllFilter(false);
                  _getAdvanceSearchPropertyViewModel.checkAgentLookUp(true);
                  _getAdvanceSearchPropertyViewModel.updateStatus('Closed');

                  _getAdvanceSearchPropertyViewModel.statusChoiceChips[1]
                      ['isSelected'] = true;

                  Get.to(SearchResultScreen(
                    url:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}&orderby=CloseDate desc',
                    pag: true,
                    pagination: true,
                    aroundMe: false,
                  ));
                  _getAdvanceSearchPropertyViewModel.res?.response?.docs = [];
                  _getAdvanceSearchPropertyViewModel.currentPage = 1;
                  _getAdvanceSearchPropertyViewModel.updateString(true);
                  _getAdvanceSearchPropertyViewModel.setSingleUrl(
                    val:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}&orderby=CloseDate desc',
                  );
                  _getAdvanceSearchPropertyViewModel
                      .getAdvanceSearchPropertyViewModel(
                    url:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}&orderby=CloseDate desc',
                    pagination: true,
                  );
                },
                dense: true,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 30.sp),
                title: Text(
                  'View Closed Contracts',
                  overflow: TextOverflow.ellipsis,
                  style: regularWhiteText20(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Divider(
                  height: 0,
                  color: accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  _getAdvanceSearchPropertyViewModel.setShowAllFilter(false);
                  _getAdvanceSearchPropertyViewModel.checkAgentLookUp(true);
                  _getAdvanceSearchPropertyViewModel.updateStatus('Pending');

                  _getAdvanceSearchPropertyViewModel.statusChoiceChips[2]
                      ['isSelected'] = true;

                  Get.to(SearchResultScreen(
                    url:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}',
                    pag: true,
                    pagination: true,
                    aroundMe: false,
                  ));
                  _getAdvanceSearchPropertyViewModel.res?.response?.docs = [];
                  _getAdvanceSearchPropertyViewModel.currentPage = 1;
                  _getAdvanceSearchPropertyViewModel.updateString(true);
                  _getAdvanceSearchPropertyViewModel.setSingleUrl(
                    val:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}',
                  );
                  _getAdvanceSearchPropertyViewModel
                      .getAdvanceSearchPropertyViewModel(
                    url:
                        'BuyerAgentMlsId:${globalPreferences?.getString(AppPreferences.MSL_ID)}',
                    pagination: true,
                  );
                },
                dense: true,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 30.sp),
                title: Text(
                  'View Pending Contracts',
                  overflow: TextOverflow.ellipsis,
                  style: regularWhiteText20(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Divider(
                  height: 0,
                  color: accentColor,
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
            ],
          );
        },
      ),
    ));
  }
}

class AgentMapView extends StatefulWidget {
  final String? firstname;
  final String? lastName;
  const AgentMapView({Key? key, this.firstname, this.lastName})
      : super(key: key);

  @override
  State<AgentMapView> createState() => _AgentMapViewState();
}

class _AgentMapViewState extends State<AgentMapView> {
  GetAgentLookupViewModel _getAgentLookupViewModel =
      Get.put(GetAgentLookupViewModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAgentLookupViewModel>(builder: (controller) {
      return Container(
        height: 374.sp,
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: Get.width,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: controller.markers == {} ||
                  controller.response!.response!.docs!.isEmpty
              ? GoogleMap(
                  onTap: (val) {
                    if (controller.docs!.isEmpty ||
                        controller.docs == null ||
                        controller.markers == {}) {
                    } else {
                      Get.to(AgentMapScreen(
                        firstname: widget.firstname,
                        lastname: widget.lastName,
                      ));
                      controller.showMap = false;
                      controller.updateMenu(false);
                    }
                  },
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(43.000000, -75.000000),
                    zoom: 7,
                  ),
                  onCameraMoveStarted: () {
                    // controller.changMenuVisi(false);
                    // controller.docs!.clear();
                  },
                  onMapCreated: (GoogleMapController controller1) {
                    controller.mapController.complete(controller1);
                  },
                )
              : GoogleMap(
                  onTap: (val) {
                    if (controller.docs!.isEmpty ||
                        controller.docs == null ||
                        controller.markers == {}) {
                    } else {
                      Get.to(AgentMapScreen(
                        docs: controller.docs,
                        firstname: widget.firstname,
                        lastname: widget.lastName,
                      ));
                      controller.showMap = false;
                      controller.updateMenu(false);
                    }
                    // Get.to(AgentMapScreen(
                    //   docs: controller.docs,
                    // ));
                    // controller.showMap = false;
                    // controller.updateMenu(false);
                  },
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        controller.markers == {}
                            ? controller.lati
                            : double.parse(controller
                                .cordinates.first['cordinates'][1]
                                .toString()),
                        controller.markers == {}
                            ? controller.longi
                            : double.parse(controller
                                .cordinates.first['cordinates'][0]
                                .toString())),
                    zoom: 7,
                  ),
                  markers: controller.markers,
                  onCameraMoveStarted: () {
                    // controller.changMenuVisi(false);
                    // controller.docs!.clear();
                  },
                  onMapCreated: (GoogleMapController controller1) {
                    controller.mapController.complete(controller1);
                  },
                ),
        ),
      );
    });
  }
}
