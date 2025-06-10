import 'dart:convert';
import 'dart:developer';

import 'package:agentapp/controllers/uiControllers/home_screen_controller.dart';
import 'package:agentapp/controllers/uiControllers/property_detail_screen_controller.dart';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart'
    as rs;
import 'package:agentapp/screens/property_image_screen.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/viewModel/get_client_list_view_model.dart';
import 'package:agentapp/viewModel/recent_viewd_properties_view_model.dart';
import 'package:agentapp/viewModel/request_offer_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart';
import '../../utils/widgets.dart';
import 'components.dart';

RxBool offerRequested = false.obs;

class PropertyDetailScreen extends StatefulWidget {
  final rs.Doc? docs;
  const PropertyDetailScreen({Key? key, this.docs}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  var activeIndex = 0.obs;

  var carouselController = CarouselController();
  late HomeScreenController homeScreenController;

  late PropertyDetailScreenController propertyDetailScreenController;
  GetClientListViewModel _getClientListViewModel =
      Get.put(GetClientListViewModel());
  RequestOfferViewModel _requestOfferViewModel =
      Get.put(RequestOfferViewModel());
  RecentViewPropertiesViewModel _recentViewPropertiesViewModel =
      Get.put(RecentViewPropertiesViewModel());
  Map<String, dynamic> vr = {};
  Map<String, dynamic> vrs = {};
  List<Map<String, dynamic>> data = [];
  List<dynamic> data1 = [];
  @override
  void initState() {
    changePre();
    try {
      widget.docs!.mediaUrl!.forEach((element) {
        precacheImage(NetworkImage(element), context);
      });
    } catch (e) {
      // TODO
    }
    super.initState();
    _getClientListViewModel.getClientListViewModel();
    homeScreenController =
        Get.put(HomeScreenController(), tag: NamedRoutes.routeHome);
    propertyDetailScreenController = Get.put(PropertyDetailScreenController(),
        tag: NamedRoutes.routePropertyDetail);
  }

  bool check = false;
  changePre() {
    List<dynamic> listss = jsonDecode(
        globalPreferences!.getString(AppPreferences.RECENTLY_VIEW).toString());

    listss.forEach((element) {
      data1.add(element);
    });
    for (int i = 0; i < data1.length; i++) {
      if (widget.docs!.listingId == data1[i]['id']) {
        int inx = i;

        data1.removeAt(inx);
        check = true;
      } else {
        print('NOT CONTAIN');
      }
    }
    if (check == true) {
      print('AA${data1.length}');
      vrs = {
        'id': '${widget.docs!.listingId}',
        'street': '${widget.docs!.unparsedAddress}',
        'city': '${widget.docs!.city}',
        'state': '${widget.docs!.country}',
        'code': '${widget.docs!.postalCode}',
        'url': '${widget.docs!.mediaUrl![0]}',
      };
      data1.insert(0, vrs);
      print('A22A${data1.length}');
      globalPreferences?.setString(
          AppPreferences.RECENTLY_VIEW, '${json.encode(data1)}');
      Future.delayed(Duration.zero, () {
        _recentViewPropertiesViewModel.setRecentView();
      });
    } else {
      globalPreferences?.setString(AppPreferences.RECENTLY_VIEW, '');
      data1.removeLast();
      vr = {
        'id': '${widget.docs!.listingId}',
        'street': '${widget.docs!.unparsedAddress}',
        'city': '${widget.docs!.city}',
        'state': '${widget.docs!.country}',
        'code': '${widget.docs!.postalCode}',
        'url': '${widget.docs!.mediaUrl![0]}',
      };
      data1.insert(0, vr);
      Future.delayed(Duration.zero, () {
        globalPreferences?.setString(
            AppPreferences.RECENTLY_VIEW, '${json.encode(data1)}');
        _recentViewPropertiesViewModel.setRecentView();
      });
    }
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
    return SafeArea(
      child: Column(
        children: [
          verticalSpace(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 20),
            child: Row(
              children: [
                MyBackButton(),
                horizontalSpace(),
                Text(
                  '/${widget.docs!.unparsedAddress}',
                  style: regularWhiteText12(accentColor),
                )
              ],
            ),
          ),
          verticalSpace(),
          Expanded(
            child: MyCustomScrollBar(
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(height: 12),
                    buildCarousal(size),
                    verticalSpace(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.docs!.unparsedAddress}',
                                      maxLines: 1,
                                      style: regularWhiteText18(accentColor),
                                    ),
                                    Text(
                                      '${widget.docs!.city} ${widget.docs!.country}, ${widget.docs!.postalCode}',
                                      style:
                                          regularWhiteText14(disabledTextColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 9.sp, vertical: 5.sp),
                                alignment: Alignment.center,
                                decoration:
                                    rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                        4, Colors.transparent, accentColor,
                                        borderWidth: 1.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: '${widget.docs!.daysOnMarket}\n',
                                    style: boldWhiteText14(accentColor),
                                    children: [
                                      TextSpan(
                                        text: 'Days',
                                        style: regularWhiteText12(accentColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.docs!.listPrice.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                  style: boldWhiteText18(accentColor),
                                ),
                                !(offerRequested.value)
                                    ? Row(
                                        children: [
                                          SweetButton(
                                            onPressed: () {
                                              Share.share(
                                                  'https://www.methodatlanta.com/properties/listing/${widget.docs!.originatingSystemId}/${widget.docs!.listingId}/');
                                              // launchUrl(Uri.parse(
                                              //     'https://www.methodatlanta.com/properties/listing/${widget.docs!.originatingSystemId}/${widget.docs!.listingId}/'));
                                            },
                                            child: Image.asset(
                                              'assets/images/ic_share.png',
                                              height: 44,
                                            ),
                                          ),
                                          horizontalSpace(),
                                          SweetButton(
                                            onPressed: () {},
                                            child: Image.asset(
                                              'assets/images/ic_favourite.png',
                                              height: 44,
                                            ),
                                          ),
                                          horizontalSpace(),
                                          SweetButton(
                                            onPressed: () {
                                              propertyDetailScreenController
                                                      .isFileSelected.value =
                                                  !(propertyDetailScreenController
                                                      .isFileSelected.value);
                                            },
                                            child: Obx(() {
                                              return Image.asset(
                                                (propertyDetailScreenController
                                                        .isFileSelected.value)
                                                    ? 'assets/images/ic_file_selected.png'
                                                    : 'assets/images/ic_file.png',
                                                height: 44,
                                              );
                                            }),
                                          ),
                                        ],
                                      )
                                    : SweetButton(
                                        onPressed: () {
                                          offerRequested.value = false;
                                          _getClientListViewModel
                                              .changeRead(false);
                                          _getClientListViewModel
                                              .updateFiled(false);
                                          _getClientListViewModel
                                              .changeStatusM(false);
                                          _requestOfferViewModel.firstClient
                                              .clear();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 12),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 6),
                                          alignment: Alignment.center,
                                          decoration:
                                              rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                  10,
                                                  Colors.transparent,
                                                  accentColor,
                                                  borderWidth: 1.0),
                                          child: Text(
                                            'Cancel',
                                            style:
                                                regularWhiteText16(accentColor),
                                          ),
                                        ),
                                      ),
                              ],
                            );
                          }),
                          verticalSpace(),
                          Visibility(
                            visible: !(offerRequested.value),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(height: 10),
                                Obx(() {
                                  return !(propertyDetailScreenController
                                          .isFileSelected.value)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text:
                                                    '${widget.docs!.bedroomsTotal}\n',
                                                style: boldWhiteText18(
                                                    accentColor),
                                                children: [
                                                  TextSpan(
                                                    text: 'Beds',
                                                    style: regularWhiteText14(
                                                        disabledTextColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text:
                                                    '${widget.docs!.bathroomsTotalDecimal}\n',
                                                style: boldWhiteText18(
                                                    accentColor),
                                                children: [
                                                  TextSpan(
                                                    text: 'Baths',
                                                    style: regularWhiteText14(
                                                        disabledTextColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: widget.docs!
                                                            .buildingAreaTotal ==
                                                        null
                                                    ? '0\n'
                                                    : '${(widget.docs!.buildingAreaTotal!).toString().replaceAllMapped(reg, mathFunc)}\n',
                                                style: boldWhiteText18(
                                                    accentColor),
                                                children: [
                                                  TextSpan(
                                                    text: 'Sq. Feet',
                                                    style: regularWhiteText14(
                                                        disabledTextColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: widget.docs!.yearBuilt ==
                                                        null
                                                    ? '\n'
                                                    : '${widget.docs!.yearBuilt}\n',
                                                style: boldWhiteText18(
                                                    accentColor),
                                                children: [
                                                  TextSpan(
                                                    text: 'Year Built',
                                                    style: regularWhiteText14(
                                                        disabledTextColor),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            widget.docs!.originatingSystemName ==
                                                    "First Multiple Listing Service"
                                                ? Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        launchUrl(Uri.parse(
                                                            'https://fmls.remine.com/docs/matrix-docs/?listingid=${widget.docs!.listingKeyNumeric}&DocType=2.'));
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                                8,
                                                                Colors
                                                                    .transparent,
                                                                accentColor,
                                                                borderWidth:
                                                                    1.0),
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.center,
                                                          text: TextSpan(
                                                            text: 'View\n',
                                                            style:
                                                                regularWhiteText14(
                                                                    accentColor),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Documents',
                                                                style: boldWhiteText14(
                                                                    accentColor),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            // Container(
                                            //   padding: EdgeInsets.symmetric(
                                            //       horizontal: 12, vertical: 8),
                                            //   decoration:
                                            //       rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                            //           8,
                                            //           Colors.transparent,
                                            //           accentColor,
                                            //           borderWidth: 1.0),
                                            //   child: RichText(
                                            //     textAlign: TextAlign.center,
                                            //     text: TextSpan(
                                            //       text: 'Locate\n',
                                            //       style: regularWhiteText14(
                                            //           accentColor),
                                            //       children: [
                                            //         TextSpan(
                                            //           text: 'Comparables',
                                            //           style: boldWhiteText14(
                                            //               accentColor),
                                            //         )
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  offerRequested.value = true;
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                                  decoration:
                                                      rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                          8,
                                                          Colors.transparent,
                                                          accentColor,
                                                          borderWidth: 1.0),
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Request\n',
                                                      style: regularWhiteText14(
                                                          accentColor),
                                                      children: [
                                                        TextSpan(
                                                          text: 'Offer',
                                                          style:
                                                              boldWhiteText14(
                                                                  accentColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                }),
                                verticalSpace(height: 20),
                                widget.docs!.originatingSystemName ==
                                        "First Multiple Listing Service"
                                    ? widget.docs!.mlsStatus != "Active"
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    'https://schedulingsso.showingtime.com/external?siteid=CORE.FMLS.I&mlsid=FMLS&listingid=${widget.docs!.listingId}&raid=${globalPreferences?.getString(AppPreferences.MSL_ID)}'));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp,
                                                    vertical: 10.sp),
                                                alignment: Alignment.center,
                                                decoration:
                                                    rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                        5,
                                                        Colors.transparent,
                                                        accentColor,
                                                        borderWidth: 1.5),
                                                child: Text(
                                                  'Schedule Showing',
                                                  style: regularWhiteText16(
                                                      accentColor),
                                                ),
                                              ),
                                            ),
                                          )
                                    : SizedBox(),
                                verticalSpace(height: 20),
                                PropertyInformation(
                                  docs: widget.docs,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: (offerRequested.value),
                            child: PropertyOfferRequested(docs: widget.docs),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          verticalSpace(height: 20)
        ],
      ),
    );
  }

  buildCarousal(Size size) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.docs!.mediaUrl!.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return InkWell(
              onTap: () {
                Get.to(PropertyImageScreen(
                  image: widget.docs!.mediaUrl,
                ));
                // Get.toNamed(NamedRoutes.routePropertyDetail);
              },
              child: CachedNetworkImage(
                imageUrl: '${widget.docs!.mediaUrl![pageViewIndex]}',
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 0),
              ),
              // CircularAvatar(
              //   imagePath: '${widget.docs!.mediaUrl![pageViewIndex]}',
              //   imageSize: 0,
              //   fit: BoxFit.cover,
              //   imageWidth: size.width,
              //   imageHeight: size.height,
              // ),
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 12,
            viewportFraction: 1,
            autoPlay: false,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              activeIndex.value = index;
            },
          ),
        ),
        Positioned(
          bottom: 20,
          child: Obx(() {
            return AnimatedSmoothIndicator(
              activeIndex: (activeIndex.value % 12),
              count: 12,
              effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: disabledTextColor,
                  activeDotColor: textColor),
            );
          }),
        ),
        Positioned(
          top: -10,
          right: 0,
          child: widget.docs!.mlsStatus != "Active"
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: rectangularAppBarBoxDecorationWithRadius(4),
                  child: Text('${widget.docs!.mlsStatus}',
                      style: boldWhiteText12(textColor)),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
