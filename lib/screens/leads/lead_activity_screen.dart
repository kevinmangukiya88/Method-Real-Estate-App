import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/models/responseModel/get_recent_leads_response_model.dart'
    as a;
import 'package:agentapp/models/responseModel/get_smart_list_response_model.dart';
import 'package:agentapp/screens/leads/lead_detail_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/viewModel/get_recent_leads_view_model.dart';
import 'package:agentapp/viewModel/get_smart_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/decorations.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class LeadActivityScreen extends StatefulWidget {
  const LeadActivityScreen({Key? key}) : super(key: key);

  @override
  State<LeadActivityScreen> createState() => _LeadActivityScreenState();
}

class _LeadActivityScreenState extends State<LeadActivityScreen>
    with SingleTickerProviderStateMixin {
  var searchController = TextEditingController();

  late APIController apiController;

  late TabController tabController;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  GetRecentLeadViewModel _getRecentLeadViewModel =
      Get.put(GetRecentLeadViewModel());
  GetSmartListViewModel _getSmartListViewModel =
      Get.put(GetSmartListViewModel());

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _getRecentLeadViewModel.getRecentLeadViewModel(isLoadings: false);
      }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _getSmartListViewModel.getSmartListViewModel(isLoadings: false);
      }
    });
    // _getRecentLeadViewModel.getRecentLeadViewModel();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  getRecentLeads() async {
    await _getRecentLeadViewModel.getRecentLeadViewModel();
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
                        MyBackButton(),
                        horizontalSpace(),
                        Text(
                          '/Leads',
                          style: regularWhiteText12(accentColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Container(
                      decoration:
                          rectangularCustomColorBoxAndBorderDecorationWithRadius(
                              12, lightGreyColor, Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Expanded(
                              child: SizedBox(
                                height: 52,
                                child: MyTextField(
                                  requireDensed: true,
                                  hint:
                                      'Search People by name, email, or phone',
                                  verticalPad: 16,
                                  horizontalPad: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Lead Activity',
                          style: boldWhiteText24(accentColor),
                        ),
                        SizedBox(
                          width: 13.sp,
                        ),
                        SweetButton(
                          onPressed: () {},
                          child: Container(
                            decoration:
                                rectangularAppBarBoxDecorationWithRadiusElevation(
                                    11, 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Add Lead',
                                  style: regularWhiteText14(textColor,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '867',
                              style: regularWhiteText40(accentColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Leads\nActive (24h)",
                              textAlign: TextAlign.center,
                              style: regularWhiteText16(accentColor),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: regularWhiteText40(accentColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Overdue\nLeads",
                              textAlign: TextAlign.center,
                              style: regularWhiteText16(accentColor),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '241',
                              style: regularWhiteText40(accentColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "New Leads\nThis Week",
                              textAlign: TextAlign.center,
                              style: regularWhiteText16(accentColor),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
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
            onTap: (int) {
              if (int == 0) {
                // _getRecentLeadViewModel.getRecentLeadViewModel();
              } else {
                _getSmartListViewModel.getSmartListViewModel();
              }
              print('VALUE=${int}');
            },
            labelPadding: EdgeInsets.symmetric(vertical: 5.sp),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1,
              ),
              insets: EdgeInsets.symmetric(horizontal: 50.sp),
            ),
            tabs: [
              Text(
                "Recent Leads",
                style: regularWhiteText16(accentColor),
              ),
              Text(
                "Smart Lists",
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                GetBuilder<GetRecentLeadViewModel>(
                  builder: (controller) {
                    if (controller.getRecentLeadsResponse.status ==
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
                    } else if (controller.getRecentLeadsResponse.status ==
                        Status.COMPLETE) {
                      a.GetRecentLeadsResponseModel? response = controller.res;
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView.separated(
                              controller: scrollController,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.to(LeadDetailScreen(
                                      leadId:
                                          '${response.events![index].lead!.id}',
                                    ));
                                  },
                                  dense: true,
                                  minVerticalPadding: 0,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 30.sp),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${response.events![index].lead!.name}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: regularWhiteText20(accentColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        'Stage: ${response.events![index].lead!.stage.toString().toLowerCase().split('.').last}',
                                        maxLines: 1,
                                        style: regularWhiteText10(accentColor),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${response.events![index].source}',
                                        style: regularWhiteText10(accentColor),
                                      ),
                                      Text(
                                        'Viewed 319 Hollybush Ln (2m)',
                                        style: regularWhiteText10(accentColor),
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
                              itemCount: response!.events!.length),
                          controller.isLoading == true
                              ? AbsorbPointer(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Center(
                                      child: SpinKitFadingCircle(
                                          color: accentColor),
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      );
                    } else if (controller.getRecentLeadsResponse.status ==
                        Status.ERROR) {
                      return Center(
                        child: Text('Something Went Wrong'),
                      );
                    } else {
                      return Center(
                        child: Text('Something went Wrong'),
                      );
                    }
                  },
                ),
                GetBuilder<GetSmartListViewModel>(
                  builder: (controller) {
                    if (controller.getSmartListResponse.status ==
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
                    } else if (controller.getSmartListResponse.status ==
                        Status.COMPLETE) {
                      GetSmartListResponseModel? response = controller.res;
                      return Stack(
                        children: [
                          ListView.separated(
                              controller: scrollController,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(NamedRoutes.leadDetailScreen);
                                  },
                                  dense: true,
                                  minVerticalPadding: 0,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30.sp, vertical: 0),
                                  title: Text(
                                    '${response!.smartlists![index].name}',
                                    style: regularWhiteText20(accentColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${response.smartlists![index].count} Leads',
                                        style: regularWhiteText10(accentColor),
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
                              itemCount: response!.smartlists!.length),
                          controller.isLoading == true
                              ? AbsorbPointer(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Center(
                                      child: SpinKitFadingCircle(
                                          color: accentColor),
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      );
                    } else if (controller.getSmartListResponse.status ==
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
