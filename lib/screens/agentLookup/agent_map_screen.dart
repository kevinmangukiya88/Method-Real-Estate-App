import 'dart:async';

import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:agentapp/viewModel/get_agent_lookup_view_model.dart';
import 'package:agentapp/viewModel/listing_history_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../models/responseModel/get_agent_lookup_respopnse_model.dart';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart'
    as rs;

class AgentMapScreen extends StatefulWidget {
  final List<Doc>? docs;
  final String? firstname;
  final String? lastname;
  const AgentMapScreen({this.docs, this.firstname, this.lastname}) : super();

  @override
  State<AgentMapScreen> createState() => _AgentMapScreenState();
}

class _AgentMapScreenState extends State<AgentMapScreen> {
  GetAgentLookupViewModel _agentLookupViewModel =
      Get.put(GetAgentLookupViewModel());
  ListingHistoryViewModel _listingHistoryViewModel =
      Get.put(ListingHistoryViewModel());
  Set<Marker> markers = {};
  var carouselController = CarouselController();

  @override
  void initState() {
    _agentLookupViewModel.setFullMapMarker(widget.docs);
    super.initState();
  }

  String millionShow(String str) {
    var result = NumberFormat.compact(locale: 'en').format(int.parse(str));
    if (result.contains('K') && result.length > 5) {
      result = result.substring(0, result.length - 1);
      var prefix = (result.split('.').last.length) + 1;
      var temp = (double.parse(result) * .001).toStringAsFixed(prefix);
      result = double.parse(temp).toString() + 'M';
    }
    return result;
  }

  final Completer<GoogleMapController> mapAController =
      Completer<GoogleMapController>();
  final Completer<GoogleMapController> mapBController =
      Completer<GoogleMapController>();
  bool val = false;
  rs.Doc? docs;

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
    return SafeArea(child: GetBuilder<GetAgentLookupViewModel>(
      builder: (controller) {
        return Column(
          children: [
            verticalSpace(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 20),
              child: Row(
                children: [
                  MyBackButton(),
                  horizontalSpace(),
                  Text(
                    '/${widget.firstname} ${widget.lastname}',
                    style: regularWhiteText12(accentColor),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.docs == null
                          ? 'Results()'
                          : 'Results (${widget.docs!.length})',
                      style: boldWhiteText20(accentColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.updateMapview();
                    },
                    child: Container(
                      decoration:
                          rectangularAppBarBoxDecorationWithRadiusElevation(
                              4, 2),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        controller.showMap ? 'View Map' : 'View List',
                        style: regularWhiteText12(textColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(),
            Expanded(
                child: controller.showMap
                    ? Container(
                        child: ListView.separated(
                          // controller: scrollController,
                          itemCount: widget.docs!.length,
                          itemBuilder: (BuildContext context, int index) {
                            // try {
                            //   response.response!
                            //       .docs![index].mediaUrl!
                            //       .forEach((element) {
                            //     precacheImage(
                            //         NetworkImage(element),
                            //         context);
                            //   });
                            // } catch (e) {
                            //   // TODO
                            // }
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Get.to(PropertyDetailScreen(
                                    //   docs: widget.docs![index],
                                    // ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CarouselSlider.builder(
                                          carouselController:
                                              carouselController,
                                          itemCount: widget
                                              .docs![index].mediaUrl!.length,
                                          options: CarouselOptions(
                                            aspectRatio: 15 / 9,
                                            viewportFraction: 1,
                                            autoPlay: false,
                                            enableInfiniteScroll: false,
                                            onPageChanged: (index, reason) {},
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int itemIndex,
                                              int pageViewIndex) {
                                            return InkWell(
                                                onTap: () {
                                                  var cc = rs.Doc.fromJson(
                                                      widget.docs![index]
                                                          .toJson());
                                                  Get.to(PropertyDetailScreen(
                                                    docs: cc,
                                                  ));
                                                  print(
                                                      '==num===${widget.docs![index].unparsedAddress!.split(' ').first}');
                                                  _listingHistoryViewModel
                                                      .listingHistoryViewModel(
                                                          url:
                                                              'StreetNumber:${widget.docs![index].unparsedAddress!.split(' ').first}* AND StreetName:${widget.docs![index].unparsedAddress!.split(' ').last}*');
                                                  // Get.toNamed(
                                                  //     NamedRoutes.routePropertyDetail,
                                                  //     arguments: {
                                                  //       'mlsNumber': 'test',
                                                  //       'access_token': BridgeAPIEndpoints.RESO_ACCESS_TOKEN
                                                  //     });
                                                },
                                                child: Container(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        '${widget.docs![index].mediaUrl![pageViewIndex]}',
                                                    fit: BoxFit.cover,
                                                    width: size.width,
                                                    height: size.height,
                                                    fadeInDuration:
                                                        Duration(seconds: 0),
                                                    errorWidget:
                                                        (_, url, error) =>
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
                                                ));
                                          }),
                                      Container(
                                        height: 85,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Color(0x7F191616).withOpacity(0.1),
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
                                                        '${widget.docs![index].unparsedAddress}',
                                                        // '209 Ross',
                                                        maxLines: 1,
                                                        style: boldWhiteText20(
                                                          textColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${widget.docs![index].city}, ${widget.docs![index].country} ${widget.docs![index].postalCode}',
                                                        // '',
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
                                                  '\$${widget.docs![index].listPrice.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                                  // '2100',
                                                  style: boldWhiteText30(
                                                      textColor),
                                                )
                                              ],
                                            ),
                                            Text(
                                              '${widget.docs![index].bedroomsTotal} Bed | ${widget.docs![index].bathroomsTotalDecimal} Bath | ${widget.docs![index].daysOnMarket} DOM',
                                              // '',
                                              style:
                                                  regularWhiteText16(textColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Container(
                                            height: 23,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration:
                                                rectangularAppBarBoxDecorationWithRadius(
                                                    4),
                                            child: Center(
                                              child: Text(
                                                  '${widget.docs![index].mlsStatus}',
                                                  style: boldWhiteText12(
                                                      textColor)),
                                              // Text('closed',
                                              //     style: boldWhiteText12(
                                              //         textColor)),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 8,
                            );
                          },
                        ),
                      )
                    : controller.markerss == {} || widget.docs == null
                        ? GoogleMap(
                            mapType: MapType.normal,
                            myLocationButtonEnabled: false,
                            initialCameraPosition: CameraPosition(
                              zoom: 9,
                              target: LatLng(43.000000, -75.000000),
                            ),
                            onCameraMoveStarted: () {
                              // controller.changMenuVisi(false);
                              // controller.docs!.clear();
                            },
                            onMapCreated: (GoogleMapController controller) {
                              mapAController.complete(controller);
                            },
                          )
                        : Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GoogleMap(
                                mapType: MapType.normal,
                                myLocationButtonEnabled: false,
                                initialCameraPosition: CameraPosition(
                                  zoom: 9,
                                  target: LatLng(
                                      double.parse(widget
                                          .docs![0].coordinates![1]
                                          .toString()),
                                      double.parse(widget
                                          .docs![0].coordinates![0]
                                          .toString())),
                                ),
                                markers: controller.markerss,
                                onCameraMoveStarted: () {
                                  controller.updateMenu(false);
                                  controller.docsS!.clear();
                                },
                                onMapCreated:
                                    (GoogleMapController controller1) {
                                  mapBController.complete(controller1);
                                },
                              ),
                              controller.showMenuVisible
                                  ? Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CarouselSlider.builder(
                                            carouselController:
                                                carouselController,
                                            itemCount: controller
                                                .docsS!.last.mediaUrl!.length,
                                            options: CarouselOptions(
                                              aspectRatio: 15 / 9,
                                              viewportFraction: 1,
                                              autoPlay: false,
                                              enableInfiniteScroll: false,
                                              onPageChanged: (index, reason) {},
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) {
                                              return InkWell(
                                                  onTap: () {
                                                    var cc = rs.Doc.fromJson(
                                                        controller.docsS![0]
                                                            .toJson());
                                                    Get.to(PropertyDetailScreen(
                                                      docs: cc,
                                                    ));
                                                    print(
                                                        '==num===${widget.docs![0].unparsedAddress!.split(' ').first}');
                                                    _listingHistoryViewModel
                                                        .listingHistoryViewModel(
                                                            url:
                                                                'StreetNumber:${widget.docs![0].unparsedAddress!.split(' ').first}* AND StreetName:${widget.docs![0].unparsedAddress!.split(' ').last}*');
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Container(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              '${controller.docsS![0].mediaUrl![pageViewIndex]}',
                                                          fit: BoxFit.cover,
                                                          width: size.width,
                                                          height: size.height,
                                                          fadeInDuration:
                                                              Duration(
                                                                  seconds: 0),
                                                          errorWidget: (_, url,
                                                                  error) =>
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
                                                                LinearGradient(
                                                                    colors: [
                                                              Color(0x7F191616)
                                                                  .withOpacity(
                                                                      0.1),
                                                              Color(0x7F191616)
                                                                  .withOpacity(
                                                                      0.2)
                                                            ])),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15,
                                                                vertical: 3),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${controller.docsS![0].unparsedAddress}',
                                                                        maxLines:
                                                                            1,
                                                                        style:
                                                                            boldWhiteText20(
                                                                          textColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${controller.docsS![0].city}, ${controller.docsS![0].country} ${controller.docsS![0].postalCode}',
                                                                        style: regularWhiteText14(
                                                                            textColor),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 3,
                                                                ),
                                                                Text(
                                                                  '\$${controller.docsS![0].listPrice.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                                                  style: boldWhiteText30(
                                                                      textColor),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              '${controller.docsS![0].bedroomsTotal} Bed | ${controller.docsS![0].bathroomsTotalDecimal} Bath | ${controller.docsS![0].daysOnMarket} DOM',
                                                              style:
                                                                  regularWhiteText16(
                                                                      textColor),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 10,
                                                        right: 10,
                                                        child: controller
                                                                    .docsS![0]
                                                                    .mlsStatus !=
                                                                'Active'
                                                            ? Container(
                                                                height: 23,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                ),
                                                                decoration:
                                                                    rectangularAppBarBoxDecorationWithRadius(
                                                                        4),
                                                                child: Center(
                                                                  child: Text(
                                                                      '${controller.docsS![0].mlsStatus}',
                                                                      style: boldWhiteText12(
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
                            ],
                          )),
          ],
        );
      },
    ));
  }
}
