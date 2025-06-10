import 'dart:async';
import 'package:agentapp/screens/advanced_search_screen.dart';
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import '../../controllers/uiControllers/search_result_controller.dart';
import '../../utils/app_preferences.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/decorations.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class ListingView extends StatefulWidget {
  final bool? showList;
  const ListingView({Key? key, this.showList}) : super(key: key);

  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView> {
  var carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: 5,
                    options: CarouselOptions(
                      aspectRatio: 15 / 13,
                      viewportFraction: 1,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {},
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return InkWell(
                        onTap: () {
                          if (widget.showList == true) {
                          } else {
                            Get.toNamed(NamedRoutes.routePropertyDetail,
                                arguments: {
                                  'mlsNumber': 'test',
                                  'access_token':
                                      BridgeAPIEndpoints.RESO_ACCESS_TOKEN
                                });
                          }
                        },
                        child: CircularAvatar(
                          imagePath:
                              'https://source.unsplash.com/random/800x800/?img=1',
                          imageSize: 0,
                          imageWidth: size.width,
                          imageHeight: size.height,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1140 Mystic Ridge Place',
                                    style: boldWhiteText14(textColor),
                                  ),
                                  Text(
                                    'Cumming, GA 300400',
                                    style: regularWhiteText14(textColor),
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpace(),
                            Text(
                              '\$465,000',
                              style: boldWhiteText24(textColor),
                            )
                          ],
                        ),
                        Text(
                          '5 Bed | 3 Bath | 310 DOM',
                          style: regularWhiteText14(textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12.sp,
                  right: 7.sp,
                  child: Container(
                    decoration: rectangularAppBarBoxDecorationWithRadius(0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Hold',
                      style: regularWhiteText14(textColor),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: index < 9,
              child: verticalSpace(),
            )
          ],
        );
      },
    );
  }
}

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  var carouselController = CarouselController();

  var cameraMoving = false.obs;

  @override
  void initState() {
    setMarker();
    super.initState();
  }

  setMarker() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    Size size = MediaQuery.of(context).size;
    return GetBuilder<GetAdvanceSearchPropertyViewModel>(
      builder: (controller) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    controller.res!.response!.docs!.isEmpty
                        ? double.parse(globalPreferences!
                            .getString(AppPreferences.LATITUDE)
                            .toString())
                        : double.parse(controller
                            .res!.response!.docs![0].coordinates![1]
                            .toString()),
                    controller.res!.response!.docs!.isEmpty
                        ? double.parse(globalPreferences!
                            .getString(AppPreferences.LONGITUDE)
                            .toString())
                        : double.parse(controller
                            .res!.response!.docs![0].coordinates![0]
                            .toString())),
                zoom: 7,
              ),
              onCameraMoveStarted: () {
                controller.changMenuVisi(false);
                controller.docs!.clear();
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: controller.markers,
            ),
            SafeArea(
              top: false,
              child: controller.showMenuVisible == true
                  ? controller.docs!.isEmpty
                      ? SizedBox()
                      : Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CarouselSlider.builder(
                                carouselController: carouselController,
                                itemCount: controller.docs![0].mediaUrl!.length,
                                options: CarouselOptions(
                                  aspectRatio: 15 / 9,
                                  viewportFraction: 1,
                                  autoPlay: false,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {},
                                ),
                                itemBuilder: (BuildContext context,
                                    int itemIndex, int pageViewIndex) {
                                  return InkWell(
                                      onTap: () {
                                        Get.to(PropertyDetailScreen(
                                          docs: controller.docs![0],
                                        ));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${controller.docs![0].mediaUrl![pageViewIndex]}',
                                              fit: BoxFit.cover,
                                              width: size.width,
                                              height: size.height,
                                              fadeInDuration:
                                                  Duration(seconds: 0),
                                              errorWidget: (_, url, error) =>
                                                  PlaceholderWidget(),
                                            ),
                                            //     CircularAvatar(
                                            //   imagePath:
                                            //       '${response.response!.docs![index].mediaUrl![pageViewIndex]}',
                                            //   imageSize:
                                            //       0,
                                            //   imageWidth:
                                            //       size.width,
                                            //   imageHeight:
                                            //       size.height,
                                            //   fit: BoxFit
                                            //       .cover,
                                            // ),
                                          ),
                                          Container(
                                            height: 85,
                                            decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                              Color(0x7F191616)
                                                  .withOpacity(0.1),
                                              Color(0x7F191616).withOpacity(0.2)
                                            ])),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.docs![0].unparsedAddress}',
                                                            maxLines: 1,
                                                            style:
                                                                boldWhiteText20(
                                                              textColor,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${controller.docs![0].city}, ${controller.docs![0].country} ${controller.docs![0].postalCode}',
                                                            style:
                                                                regularWhiteText14(
                                                                    textColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text(
                                                      '\$${controller.docs![0].listPrice.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                                      style: boldWhiteText30(
                                                          textColor),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  '${controller.docs![0].bedroomsTotal} Bed | ${controller.docs![0].bathroomsTotalDecimal} Bath | ${controller.docs![0].daysOnMarket} DOM',
                                                  style: regularWhiteText16(
                                                      textColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: controller
                                                        .docs![0].mlsStatus !=
                                                    'Active'
                                                ? Container(
                                                    height: 23,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                    ),
                                                    decoration:
                                                        rectangularAppBarBoxDecorationWithRadius(
                                                            4),
                                                    child: Center(
                                                      child: Text(
                                                          '${controller.docs![0].mlsStatus}',
                                                          style:
                                                              boldWhiteText12(
                                                                  textColor)),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          )
                                        ],
                                      ));
                                }),
                          ],
                        )
                  : SizedBox(),
            ),
          ],
        );
      },
    );
  }
}

class SortResults extends StatefulWidget {
  const SortResults({super.key});
  @override
  State<SortResults> createState() => _SortResultsState();
}

class _SortResultsState extends State<SortResults> {
  var activeIndex = 0.obs;
  var isMLS = false.obs;
  var carouselController = CarouselController();
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());

  List<Map<String, dynamic>> sortByChoiceChips = [
    {'title': 'Status', 'isSelected': true},
    {'title': 'Price', 'isSelected': false},
    {'title': 'DOM', 'isSelected': false},
    {'title': 'Modified', 'isSelected': false},
  ];

  List<Map<String, dynamic>> propertyChoiceChips = [
    {'title': 'All', 'isSelected': true},
    {'title': 'House', 'isSelected': false},
    {'title': 'Condo', 'isSelected': false},
    {'title': 'Town Home', 'isSelected': false},
  ];

  List<Map<String, dynamic>> basementChoiceChips = [
    {'title': 'All', 'isSelected': true},
    {'title': 'Slab', 'isSelected': false},
    {'title': 'Finished', 'isSelected': false},
    {'title': 'UnFinished', 'isSelected': false},
  ];

  List<Map<String, dynamic>> yearBuiltChoiceChips = [
    {'title': 'All', 'isSelected': true},
    {'title': '1990+', 'isSelected': false},
    {'title': '2000+', 'isSelected': false},
    {'title': '2010+', 'isSelected': false},
  ];

  List<Map<String, dynamic>> lotSizeChoiceChips = [
    {'title': 'All', 'isSelected': true},
    {'title': '1 Acre+', 'isSelected': false},
    {'title': '3 Acre+', 'isSelected': false},
    {'title': '10 Acre+', 'isSelected': false},
  ];
  List<Map<String, dynamic>> statusChoiceChips = [
    {'title': 'Active', 'isSelected': true},
    {'title': 'Closed', 'isSelected': false},
    {'title': 'Pending', 'isSelected': false},
    {'title': 'Expired', 'isSelected': false},
  ];

  var _currentRangeValues = RangeValues(0, 6000).obs;

  late SearchResultController searchResultController;

  @override
  void initState() {
    searchResultController = Get.put(SearchResultController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MLS',
                    style: boldWhiteText14(accentColor),
                  ),
                  verticalSpace(),
                  GetBuilder<SearchResultController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Material(
                              clipBehavior: Clip.antiAlias,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      searchResultController.isFMlsSelected
                                          ? 12.0
                                          : 0),
                                ),
                              ),
                              child: InkWell(
                                  onTap: () {
                                    searchResultController.changeFMLSValue();
                                    _getAdvanceSearchPropertyViewModel
                                        .updateString(true);
                                  },
                                  child: Container(
                                    decoration:
                                        rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                            4,
                                            Colors.transparent,
                                            searchResultController
                                                        .isFMlsSelected ==
                                                    true
                                                ? accentColor
                                                : Colors.transparent,
                                            borderWidth: 1.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Image.asset(
                                        'assets/images/ic_fmls.png',
                                        width: 120,
                                        height: 36),
                                  )),
                            ),
                            Positioned(
                              right: -3.sp,
                              top: -3.sp,
                              child: Icon(
                                Icons.check,
                                color: searchResultController.isFMlsSelected ==
                                        true
                                    ? accentColor
                                    : Colors.transparent,
                                size: 20.sp,
                              ),
                            )
                          ],
                        ),
                        horizontalSpace(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Material(
                              clipBehavior: Clip.antiAlias,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      searchResultController.isMlsSelected
                                          ? 12.0
                                          : 0),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  searchResultController.changeMLSValue();
                                  _getAdvanceSearchPropertyViewModel
                                      .updateString(false);
                                },
                                child: Container(
                                  decoration:
                                      rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                          4,
                                          Colors.transparent,
                                          searchResultController.isMlsSelected
                                              ? accentColor
                                              : Colors.transparent,
                                          borderWidth: 1.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Image.asset('assets/images/ic_mls.png',
                                      width: 120, height: 36),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -3.sp,
                              top: -3.sp,
                              child: Icon(
                                Icons.check,
                                color: searchResultController.isMlsSelected
                                    ? accentColor
                                    : Colors.transparent,
                                size: 20.sp,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              verticalSpace(height: 20),
              GetBuilder<GetAdvanceSearchPropertyViewModel>(
                builder: (controller) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sort By',
                            style: boldWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: List.generate(
                          //         controller.sortByChoiceChips.length, (index) {
                          //       var chip = controller.sortByChoiceChips[index];
                          //       return Container(
                          //         margin:
                          //         EdgeInsets.symmetric(horizontal: 5.sp),
                          //         child: SweetButton(
                          //           onPressed: () {
                          //             controller.sortByChoiceChips
                          //                 .forEach((chip) {
                          //               chip['isSelected'] = false;
                          //             });
                          //             setState(() {
                          //               chip['isSelected'] = true;
                          //               // widget.onSelected(chip);
                          //               Map<String, dynamic> chipSelected =
                          //               (chip);
                          //               controller.updateStatus(
                          //                   chipSelected['title']);
                          //             });
                          //           },
                          //           child: Container(
                          //             alignment: Alignment.center,
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: 15, vertical: 6),
                          //             decoration:
                          //             rectangularCustomColorBoxAndBorderDecorationWithRadius(
                          //                 10,
                          //                 (chip['isSelected'])
                          //                     ? accentColor
                          //                     : Colors.transparent,
                          //                 (chip['isSelected'])
                          //                     ? accentColor
                          //                     : disabledTextColor,
                          //                 borderWidth: 1.0),
                          //             child: Text(
                          //               chip['title'],
                          //               style: regularWhiteText14(
                          //                   (chip['isSelected'])
                          //                       ? textColor
                          //                       : disabledTextColor),
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     }),
                          //   ),
                          // ),
                          CustomChoiceChips(
                            chipsData: controller.sortByChoiceChips,
                            onSelected: (Map<String, dynamic> chipSelected) {
                              controller.updateSort(chipSelected['title']);
                              print('UPDATE==${controller.sort}');
                            },
                          ),
                        ],
                      ),
                      verticalSpace(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),

                          CustomChoiceChips(
                            chipsData: controller.statusChoiceChips,
                            onSelected: (Map<String, dynamic> chipSelected) {
                              controller.updateStatus(chipSelected['title']);
                              print('UPDATE==${controller.sort}');
                            },
                          )
                          // CustomChoiceChips(
                          //   chipsData: controller.statusChoiceChips,
                          //   onSelected: (Map<String, dynamic> chipSelected) {
                          //     controller.updateStatus(chipSelected['title']);
                          //   },
                          // ),
                        ],
                      ),
                      verticalSpace(height: 20),
                    ],
                  );
                },
              ),
              _getAdvanceSearchPropertyViewModel.showAllFilter == true
                  ? SizedBox()
                  : AdvancedSearchFilterScreen(showSearch: true),
              _getAdvanceSearchPropertyViewModel.showAllFilter == true
                  ? SweetButton(
                      onPressed: () {
                        _getAdvanceSearchPropertyViewModel.setFilter('listing');
                        _getAdvanceSearchPropertyViewModel
                            .getAdvanceSearchPropertyViewModel(
                                url: _getAdvanceSearchPropertyViewModel
                                    .singleUrl,
                                type: _getAdvanceSearchPropertyViewModel.fmls,
                                pagination: false,
                                mslStatus:
                                    _getAdvanceSearchPropertyViewModel.status,
                                sorts: _getAdvanceSearchPropertyViewModel.sort,
                                isLoadings: true);
                      },
                      child: Container(
                        decoration:
                            rectangularAppBarBoxDecorationWithRadiusElevation(
                                40, 4),
                        child: CustomizedButton(
                          text: 'Update',
                          verticalPadding: 20,
                          textColor: textColor,
                        ),
                      ),
                    )
                  : SizedBox(),
              verticalSpace(height: 20),
            ],
          )),
    );
  }
}
