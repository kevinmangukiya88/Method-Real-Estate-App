import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/controllers/uiControllers/home_screen_controller.dart';
import 'package:agentapp/main.dart';
import 'package:agentapp/screens/advanced_search_screen.dart';
import 'package:agentapp/screens/leads/lead_claim_bottomsheet.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:agentapp/viewModel/get_knowledge_view_model.dart';
import 'package:agentapp/viewModel/get_payment_record_view_model.dart';
import 'package:agentapp/viewModel/get_recent_leads_view_model.dart';
import 'package:agentapp/viewModel/get_transaction_closed_view_model.dart';
import 'package:agentapp/viewModel/get_transactions_contracts_view_model.dart';
import 'package:agentapp/viewModel/listing_history_view_model.dart';
import 'package:agentapp/viewModel/recent_viewd_properties_view_model.dart';
import 'package:agentapp/viewModel/store_lead_detail.dart';
import 'package:agentapp/viewModel/update_device_token_view_model.dart';
import 'package:app_settings/app_settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/widgets.dart';
import 'searchResults/search_result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen() : super();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  var carouselController = CarouselController();
  late APIController apiController;
  late HomeScreenController homeScreenController;

  UpdateDeviceTokenViewModel _updateWebPushTokenViewModel =
      Get.put(UpdateDeviceTokenViewModel());
  GetTransactionsContractsViewModel _getTransactionsContractsViewModel =
      Get.put(GetTransactionsContractsViewModel());
  GetPaymentRecordViewModel getPaymentRecordViewModel =
      Get.put(GetPaymentRecordViewModel());
  GetRecentLeadViewModel _getRecentLeadViewModel =
      Get.put(GetRecentLeadViewModel());
  RecentViewPropertiesViewModel _recentViewPropertiesViewModel =
      Get.put(RecentViewPropertiesViewModel());

  GetKnowledgeBaseViewModel _getKnowledgeBaseViewModel =
      Get.put(GetKnowledgeBaseViewModel());
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());
  GetTransactionClosedViewModel _getTransactionClosedViewModel =
      Get.put(GetTransactionClosedViewModel());
  ListingHistoryViewModel _listingHistoryViewModel =
      Get.put(ListingHistoryViewModel());
  final list = [];
  @override
  void initState() {
    _recentViewPropertiesViewModel.setRecentView();
    Future.delayed(Duration.zero, () {
      showNotificationSheet();
    });
    super.initState();

    apiController = Get.put(APIController(), tag: NamedRoutes.routeHome);
    homeScreenController =
        Get.put(HomeScreenController(), tag: NamedRoutes.routeHome);
    initialization();
    _getTransactionsContractsViewModel.getTransactionsContractsViewModel(
        type: 'active', isLoadings: false);
    _getTransactionClosedViewModel.getTransactionClosedViewModel(
        type: 'closed', isLoadings: false);
    getPaymentRecordViewModel.getPaymentRecordViewModel(isLoadings: false);
    _getRecentLeadViewModel.getRecentLeadViewModel();
    _getKnowledgeBaseViewModel.getKnowledgeBaseViewModel();
    WidgetsBinding.instance.addObserver(this);
  }

  showNotificationSheet() async {
    try {
      if (notificationData.isNotEmpty) {
        var payload = notificationData;
        if (isBottomSheetOpen.value == true) {
          Get.back();
          try {
            DetailData.timer?.cancel();
          } catch (e) {}
          try {
            DetailData.timer = null;
          } catch (e) {}
        }
        isBottomSheetOpen.value = true;

        await appModalBottomSheet(data: payload);
      }
    } catch (e) {
      // TODO
    }
  }

  initialization() async {
    try {
      homeScreenController.userInformation.value.market?.datasets
          ?.forEach((element) {
        //load json assets there & populate them in Home screen controller fields
      });
    } catch (e) {
      // TODO
    }

    try {
      _updateWebPushTokenViewModel.updateDeviceTokenViewModel();
    } catch (e) {
      // TODO
    }
  }

  @override
  void dispose() {
    try {
      globalPreferences!.remove(AppPreferences.NOTIFICATION_PAYLOAD);
    } catch (e) {
      // TODO
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('==1===');
    homeScreenController =
        Get.put(HomeScreenController(), tag: NamedRoutes.routeHome);
    switch (state) {
      case AppLifecycleState.resumed:
        apiController = Get.put(APIController(), tag: NamedRoutes.routeHome);
        homeScreenController =
            Get.put(HomeScreenController(), tag: NamedRoutes.routeHome);
        _recentViewPropertiesViewModel.setRecentView();
        initialization();
        print('==2===');
        if (kDebugMode) {
          print("app is resumed");
        }
        break;
      case AppLifecycleState.inactive:
        if (kDebugMode) {
          print("app is inactive");
        }
        break;
      case AppLifecycleState.paused:
        if (kDebugMode) {
          print("app is paused");
        }
        break;
      case AppLifecycleState.detached:
        if (kDebugMode) {
          print("app is detached");
        }
        break;
    }
  }

  TextEditingController _searchCity = TextEditingController();

  var data;
  bool show = false;
  LocationPermission? permission;
  LatLng? currentPostion;
  double? latitude;
  double? longitude;
  void _getUserLocation() async {
    print('CURRENT==${currentPostion}');
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
    print('');
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quick Search',
                        style: boldWhiteText24(accentColor),
                      ),
                      InkWell(
                        onTap: () async {
                          permission = await Geolocator.requestPermission();
                          if (permission == LocationPermission.whileInUse ||
                              permission == LocationPermission.always) {
                            var position = await GeolocatorPlatform.instance
                                .getCurrentPosition(
                                    locationSettings: LocationSettings(
                                        accuracy: LocationAccuracy.high));
                            currentPostion =
                                LatLng(position.latitude, position.longitude);
                            List<Placemark> placemarks =
                                await placemarkFromCoordinates(
                                    currentPostion!.latitude,
                                    currentPostion!.longitude);
                            // globalPreferences?.setString(AppPreferences.CITY,
                            //     '${placemarks[0].locality.toString().replaceAll(' ', '')}');
                            //
                            // globalPreferences?.setString(
                            //     AppPreferences.LATITUDE,
                            //     '${currentPostion!.latitude}');
                            // globalPreferences?.setString(
                            //     AppPreferences.LONGITUDE,
                            //     '${currentPostion!.longitude}');
                            // _getAdvanceSearchPropertyViewModel
                            //     .setShowAllFilter(true);
                            // _getAdvanceSearchPropertyViewModel
                            //     .updateString(false);
                            // _getAdvanceSearchPropertyViewModel.docs!.clear();
                            // _getAdvanceSearchPropertyViewModel
                            //     .res?.response!.docs!
                            //     .clear();
                            // Get.to(SearchResultScreen(
                            //   url:
                            //       'City:${globalPreferences!.getString(AppPreferences.CITY)}',
                            //   pagination: true,
                            //   aroundMe: true,
                            // ));
                            //
                            // _getAdvanceSearchPropertyViewModel.setSingleUrl(
                            //     val:
                            //         'City:${globalPreferences!.getString(AppPreferences.CITY)}');
                            // _getAdvanceSearchPropertyViewModel.setApiCall(
                            //     url:
                            //         'City:${globalPreferences!.getString(AppPreferences.CITY)}',
                            //     pagination: false);
                          } else {
                            if (permission ==
                                    LocationPermission.deniedForever ||
                                permission == LocationPermission.denied)
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CupertinoAlertDialog(
                                      title: Text('Open Settings'),
                                      content: Text(
                                          'Please give the location Permission from the setting'),
                                      actions: [
                                        Column(
                                          children: [
                                            CupertinoDialogAction(
                                              child: Text(
                                                'Go To Settings',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              onPressed: () {
                                                AppSettings
                                                    .openLocationSettings();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            Divider(
                                              thickness: 2,
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            CupertinoDialogAction(
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.sp, vertical: 6.sp),
                          decoration:
                              rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                  13.sp, Colors.transparent, accentColor,
                                  borderWidth: 1.0),
                          child: Text(
                            'AROUND ME',
                            style: regularWhiteText14(accentColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  GetBuilder<GetAdvanceSearchPropertyViewModel>(
                    builder: (controller) {
                      return Container(
                        decoration:
                            rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                12, lightGreyColor, Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Expanded(
                                child: SizedBox(
                                  height: 52,
                                  child: MyTextField(
                                    controller: _searchCity,
                                    requireDensed: true,
                                    hint:
                                        'Enter a MLS number or Property Address',
                                    verticalPad: 16,
                                    horizontalPad: 12,
                                    onChanged: (val) {
                                      if (val.isEmpty) {
                                        controller.changeShowIcon(false);
                                      } else {
                                        controller.changeShowIcon(true);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              controller.showIcon == false
                                  ? SizedBox()
                                  : IconButton(
                                      onPressed: () {
                                        _searchCity.clear();
                                        controller.changeShowIcon(false);
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.grey,
                                        size: 15,
                                      ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SweetButton(
                          onPressed: () {
                            _getAdvanceSearchPropertyViewModel
                                .checkAgentLookUp(false);
                            _getAdvanceSearchPropertyViewModel
                                .setTotalBathRoom('0');
                            _getAdvanceSearchPropertyViewModel
                                .statusChoiceChips[0]['isSelected'] = true;
                            _getAdvanceSearchPropertyViewModel.totalBathroom =
                                '0';
                            _getAdvanceSearchPropertyViewModel.basement = 'All';
                            _getAdvanceSearchPropertyViewModel.yearBuilt =
                                'All';
                            _getAdvanceSearchPropertyViewModel.status =
                                'Active';

                            _getAdvanceSearchPropertyViewModel.lotSize = 'All';
                            _getAdvanceSearchPropertyViewModel.firstVal = "0";
                            _getAdvanceSearchPropertyViewModel.lastVal =
                                "10000000";
                            _getAdvanceSearchPropertyViewModel
                                .updateAdvanceFilter(true);
                            Get.to(AdvancedSearchScreen(
                              advance: true,
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            alignment: Alignment.center,
                            decoration:
                                rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                    20, Colors.transparent, accentColor,
                                    borderWidth: 1.5),
                            child: Text(
                              'ADVANCED SEARCH',
                              style: regularWhiteText14(accentColor),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(width: 10),
                      SweetButton(
                        onPressed: () async {
                          if (_searchCity.text.isEmpty) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'Please enter a MLS number or Property Address!'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            _getAdvanceSearchPropertyViewModel
                                .res?.response?.docs = [];
                            _getAdvanceSearchPropertyViewModel.currentPage = 1;
                            if (_searchCity.text.isNumericOnly &&
                                _searchCity.text.length >= 7) {
                              _getAdvanceSearchPropertyViewModel
                                  .setShowAllFilter(true);
                              _getAdvanceSearchPropertyViewModel
                                  .updateString(true);
                              _getAdvanceSearchPropertyViewModel
                                  .statusChoiceChips[0]['isSelected'] = true;
                              Get.to(SearchResultScreen(
                                pagination: false,
                                SearchDetail: _searchCity.text,
                              ));
                              _getAdvanceSearchPropertyViewModel.setSingleUrl(
                                  val: 'ListingId:${_searchCity.text}');
                              _getAdvanceSearchPropertyViewModel.setApiCall(
                                  url: 'ListingId:${_searchCity.text}',
                                  pagination: false);
                              _searchCity.clear();
                            } else {
                              List streetName = [];
                              List streetCode = [];
                              List searchData = _searchCity.text.split('');
                              for (int i = 0; i < searchData.length; i++) {
                                if (searchData[i].toString().isNumericOnly) {
                                  streetCode.add(searchData[i]);
                                } else {
                                  streetName.add(searchData[i]);
                                }
                              }
                              _getAdvanceSearchPropertyViewModel
                                  .updateStatus('Active');
                              _getAdvanceSearchPropertyViewModel
                                  .setShowAllFilter(true);
                              _getAdvanceSearchPropertyViewModel
                                  .updateString(true);
                              _getAdvanceSearchPropertyViewModel.setSingleUrl(
                                val: streetCode.join().isEmpty
                                    ? 'StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*'
                                    : streetName.join().isEmpty
                                        ? "StreetNumber:${streetCode.join() ?? ''}"
                                        : 'StreetNumber:${streetCode.join() ?? ''}* AND StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*',
                              );
                              _getAdvanceSearchPropertyViewModel
                                  .statusChoiceChips[0]['isSelected'] = true;
                              Get.to(SearchResultScreen(
                                pag: true,
                                url: streetCode.join().isEmpty
                                    ? 'StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*'
                                    : streetName.join().isEmpty
                                        ? "StreetNumber:${streetCode.join() ?? ''}"
                                        : 'StreetNumber:${streetCode.join() ?? ''}* AND StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*',
                                pagination: true,
                              ));
                              _getAdvanceSearchPropertyViewModel
                                  .getAdvanceSearchPropertyViewModel(
                                      url: streetCode.join().isEmpty
                                          ? 'StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*'
                                          : streetName.join().isEmpty
                                              ? "StreetNumber:${streetCode.join() ?? ''}"
                                              : 'StreetNumber:${streetCode.join() ?? ''}* AND StreetName:${streetName.join().toString().replaceAll(' ', '').capitalizeFirst ?? ''}*',
                                      pagination: streetCode.join().isEmpty
                                          ? true
                                          : streetName.join().isEmpty
                                              ? true
                                              : false);
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          alignment: Alignment.center,
                          decoration:
                              rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                  20, accentColor, accentColor,
                                  borderWidth: 1.5),
                          child: Text(
                            'SEARCH',
                            style: regularWhiteText14(textColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Recently viewed properties',
                style: boldWhiteText24(accentColor, fontSize: 22.sp),
              ),
            ),
            SizedBox(
              height: 40.sp,
            ),
            // Obx(
            //   () {
            //     var user = homeScreenController.userInformation.value;
            //     try {
            //       user.events!.forEach((element) {
            //         precacheImage(
            //             NetworkImage(element.property!.url!), context);
            //       });
            //     } catch (e) {
            //       // TODO
            //     }
            //     return Visibility(
            //       visible: (user.events?.length ?? 0) > 0,
            //       child: CarouselSlider.builder(
            //         carouselController: carouselController,
            //         itemCount: (user.events?.length ?? 0),
            //         itemBuilder: (BuildContext context, int itemIndex,
            //             int pageViewIndex) {
            //           var event = user.events![itemIndex];
            //
            //           return InkWell(
            //             onTap: () {
            //               // Get.toNamed(NamedRoutes.routePropertyDetail,
            //               //     arguments: {
            //               //       'mlsNumber': event.property?.mlsNumber,
            //               //       'access_token':
            //               //           BridgeAPIEndpoints.RESO_ACCESS_TOKEN
            //               //     });
            //               /*if ((user.market?.datasets?.contains('gamls') ??
            //                 false)) {
            //               Get.toNamed(NamedRoutes.routePropertyDetail,
            //                   arguments: {
            //                     'mlsNumber': event.property?.mlsNumber,
            //                     'access_token':
            //                         BridgeAPIEndpoints.RESO_ACCESS_TOKEN
            //                   });
            //             }
            //             if ((user.market?.datasets?.contains('miamire') ??
            //                 false)) {
            //               Get.toNamed(NamedRoutes.routePropertyDetail,
            //                   arguments: {
            //                     'mlsNumber': event.property?.mlsNumber,
            //                     'access_token': BridgeAPIEndpoints
            //                         .RESO_ACCESS_TOKEN_MIAMIRE
            //                   });
            //             }*/
            //             },
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Container(
            //                 height: 328.sp,
            //                 width: Get.width,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(30.sp),
            //                 ),
            //                 clipBehavior: Clip.antiAliasWithSaveLayer,
            //                 child: Stack(
            //                   alignment: Alignment.bottomCenter,
            //                   children: [
            //                     Positioned(
            //                       bottom: 0,
            //                       right: 0,
            //                       left: 0,
            //                       top: 0,
            //                       child: Container(
            //                         height: 328.sp,
            //                         width: Get.width,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(29),
            //                         ),
            //                         child: CachedNetworkImage(
            //                           imageUrl: '${event.property?.url}',
            //                           fit: BoxFit.cover,
            //                           fadeInDuration: Duration(seconds: 0),
            //                           errorWidget: (_, url, error) =>
            //                               PlaceholderWidget(),
            //                         ),
            //                       ),
            //                     ),
            //                     Container(
            //                       height: 78.sp,
            //                       width: Get.width,
            //                       decoration: BoxDecoration(
            //                         color: accentColor.withOpacity(0.4),
            //                         borderRadius: BorderRadius.only(
            //                             bottomLeft: Radius.circular(29),
            //                             bottomRight: Radius.circular(29)),
            //                       ),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             '${event.property?.street}',
            //                             maxLines: 1,
            //                             style: boldWhiteText18(textColor),
            //                           ),
            //                           Text(
            //                             '${event.property?.city}, ${event.property?.state}, ${event.property?.code}',
            //                             style: regularWhiteText14(textColor),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //         options: CarouselOptions(
            //           aspectRatio: 16 / 14,
            //           viewportFraction: 10.3 / 12,
            //           enableInfiniteScroll: false,
            //           autoPlay: false,
            //           scrollDirection: Axis.horizontal,
            //           onPageChanged: (index, reason) {},
            //         ),
            //       ),
            //     );
            //   },
            // ),
            GetBuilder<RecentViewPropertiesViewModel>(
              builder: (controller) {
                return CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: controller.listsS.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return InkWell(
                      onTap: () {
                        controller.recentViewPropertiesViewModel(
                            url: '${controller.listsS[pageViewIndex]['id']}');

                        // Get.toNamed(NamedRoutes.routePropertyDetail,
                        //     arguments: {
                        //       'mlsNumber': event.property?.mlsNumber,
                        //       'access_token':
                        //           BridgeAPIEndpoints.RESO_ACCESS_TOKEN
                        //     });
                        /*if ((user.market?.datasets?.contains('gamls') ??
                            false)) {
                          Get.toNamed(NamedRoutes.routePropertyDetail,
                              arguments: {
                                'mlsNumber': event.property?.mlsNumber,
                                'access_token':
                                    BridgeAPIEndpoints.RESO_ACCESS_TOKEN
                              });
                        }
                        if ((user.market?.datasets?.contains('miamire') ??
                            false)) {
                          Get.toNamed(NamedRoutes.routePropertyDetail,
                              arguments: {
                                'mlsNumber': event.property?.mlsNumber,
                                'access_token': BridgeAPIEndpoints
                                    .RESO_ACCESS_TOKEN_MIAMIRE
                              });
                        }*/
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 328.sp,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                top: 0,
                                child: Container(
                                  height: 328.sp,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${controller.listsS[pageViewIndex]['url']}',
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(seconds: 0),
                                    errorWidget: (_, url, error) =>
                                        PlaceholderWidget(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 78.sp,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: accentColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(29),
                                      bottomRight: Radius.circular(29)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${controller.listsS[pageViewIndex]['street']}',
                                      maxLines: 1,
                                      style: boldWhiteText18(textColor),
                                    ),
                                    Text(
                                      '${controller.listsS[pageViewIndex]['city']}, ${controller.listsS[pageViewIndex]['state']}, ${controller.listsS[pageViewIndex]['code']}',
                                      style: regularWhiteText14(textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 16 / 14,
                    viewportFraction: 10.3 / 12,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {},
                  ),
                );
              },
            )
            // verticalSpace(height: 20)
          ],
        ),
      ),
    );
  }
}
