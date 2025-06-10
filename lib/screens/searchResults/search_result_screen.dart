import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart'
    as aa;
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:agentapp/viewModel/listing_history_view_model.dart';
import 'package:agentapp/viewModel/recent_viewd_properties_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../utils/widgets.dart';
import 'components.dart';

class SearchResultScreen extends StatefulWidget {
  final String? url;
  final bool? pagination;
  final String? SearchDetail;
  final bool? pag;
  final bool? aroundMe;

  const SearchResultScreen(
      {Key? key,
      this.url,
      this.pagination,
      this.SearchDetail,
      this.pag,
      this.aroundMe})
      : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  var activeIndex = 0.obs;
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());
  var carouselController = CarouselController();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  ListingHistoryViewModel _listingHistoryViewModel =
      Get.put(ListingHistoryViewModel());

  @override
  void initState() {
    super.initState();
    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[3]['isSelected'] =
        true;
    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[0]['isSelected'] =
        false;
    if (widget.aroundMe == true) {
      _getAdvanceSearchPropertyViewModel.shortFilter = 'map';
    } else {
      _getAdvanceSearchPropertyViewModel.shortFilter = 'listing';
    }
    if (widget.pagination == true) {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (widget.pag == true) {
            _getAdvanceSearchPropertyViewModel.setApiCall(
                url: widget.url, pagination: true);
          } else {
            _getAdvanceSearchPropertyViewModel.setFinalApiCall(
                pagination: true, isLoading: false);
          }
        }
      });
    } // propertyDetailScreenController = Get.put(PropertyDetailScreenController(), tag: NamedRoutes.routePropertyDetail);
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
    return GetBuilder<GetAdvanceSearchPropertyViewModel>(
      builder: (controller) {
        if (controller.getAdvanceSearchPropertyResponse.status ==
            Status.INITIAL) {
          return AbsorbPointer(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: SpinKitFadingCircle(color: accentColor),
              ),
            ),
          );
        } else if (controller.getAdvanceSearchPropertyResponse.status ==
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
        } else if (controller.getAdvanceSearchPropertyResponse.status ==
            Status.COMPLETE) {
          aa.GetAdvanceSearchPropertyResponseModel? response = controller.res;
          if (response == null) {
            return Center();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Row(
                    children: [
                      MyBackButton(),
                      horizontalSpace(),
                      Text(
                        widget.SearchDetail == null
                            ? '/Search'
                            : '/Search/${widget.SearchDetail}',
                        style: regularWhiteText12(accentColor),
                      )
                    ],
                  ),
                ),
                verticalSpace(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          response.response == null
                              ? 'Results(0)'
                              : 'Results (${response.response!.numFound})',
                          style: boldWhiteText20(accentColor),
                        ),
                      ),
                      controller.shortFilter == 'sorting'
                          ? SweetButton(
                              onPressed: () {
                                if (controller.showAllFilter == true) {
                                  controller.setFilter('listing');
                                  _getAdvanceSearchPropertyViewModel
                                      .getAdvanceSearchPropertyViewModel(
                                          url:
                                              _getAdvanceSearchPropertyViewModel
                                                  .singleUrl,
                                          type:
                                              _getAdvanceSearchPropertyViewModel
                                                  .fmls,
                                          pagination: false,
                                          isLoadings: true);
                                } else {
                                  _getAdvanceSearchPropertyViewModel
                                      .updatePage();
                                  controller.setFilter('listing');
                                  controller.setFinalApiCall(
                                      pagination: true, isLoading: true);
                                }
                              },
                              child: Container(
                                decoration:
                                    rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                        8, Colors.transparent, accentColor,
                                        borderWidth: 1.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: Text(
                                  'UPDATE',
                                  style: regularWhiteText14(accentColor),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                SweetButton(
                                  onPressed: () {
                                    controller.setFilter('sorting');
                                  },
                                  child: Container(
                                    decoration:
                                        rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                            5, Colors.transparent, accentColor,
                                            borderWidth: 1.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    child: Text(
                                      'Sort & Filter',
                                      style: regularWhiteText12(accentColor),
                                    ),
                                  ),
                                ),
                                horizontalSpace(),
                                SweetButton(
                                  onPressed: () {
                                    widget.aroundMe == true
                                        ? ''
                                        : (controller.shortFilter == 'map')
                                            ? controller.setFilter('listing')
                                            : controller.setFilter('map');
                                  },
                                  child: Container(
                                    decoration:
                                        rectangularAppBarBoxDecorationWithRadiusElevation(
                                            4, 2),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    child: Text(
                                      widget.aroundMe == true
                                          ? 'View on Map'
                                          : (controller.shortFilter == 'map')
                                              ? 'View List'
                                              : 'View on Map',
                                      style: regularWhiteText12(textColor),
                                    ),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                response.response == null
                    ? SizedBox()
                    : Expanded(
                        child: (controller.shortFilter == 'map')
                            ? GoogleMapView()
                            : (controller.shortFilter == 'sorting')
                                ? SortResults()
                                : Stack(
                                    // alignment: Alignment.bottomCenter,
                                    children: [
                                      response.response!.docs!.isEmpty ||
                                              response.response == null
                                          ? SizedBox()
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              controller: scrollController,
                                              itemCount: response
                                                  .response!.docs!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                try {
                                                  response.response!
                                                      .docs![index].mediaUrl!
                                                      .forEach((element) {
                                                    precacheImage(
                                                        NetworkImage(element),
                                                        context);
                                                  });
                                                } catch (e) {
                                                  // TODO
                                                }
                                                return Column(
                                                  children: [
                                                    response
                                                            .response!
                                                            .docs![index]
                                                            .mediaUrl!
                                                            .isEmpty
                                                        ? SizedBox()
                                                        : InkWell(
                                                            onTap: () {
                                                              Get.to(
                                                                  PropertyDetailScreen(
                                                                docs: response
                                                                    .response!
                                                                    .docs![index],
                                                              ));
                                                              // var num=int.parse(response.response!.docs![index].unparsedAddress.toString());
                                                              print(
                                                                  '==num===${response.response!.docs![index].unparsedAddress!.split(' ').first}');
                                                              _listingHistoryViewModel
                                                                  .listingHistoryViewModel(
                                                                      url:
                                                                          'StreetNumber:${response.response!.docs![index].unparsedAddress!.split(' ').first}* AND StreetName:${response.response!.docs![index].unparsedAddress!.split(' ').last}*');
                                                            },
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              children: [
                                                                CarouselSlider
                                                                    .builder(
                                                                        carouselController:
                                                                            carouselController,
                                                                        itemCount: response
                                                                            .response!
                                                                            .docs![
                                                                                index]
                                                                            .mediaUrl!
                                                                            .length,
                                                                        options:
                                                                            CarouselOptions(
                                                                          aspectRatio:
                                                                              15 / 9,
                                                                          viewportFraction:
                                                                              1,
                                                                          autoPlay:
                                                                              false,
                                                                          enableInfiniteScroll:
                                                                              false,
                                                                          onPageChanged:
                                                                              (index, reason) {},
                                                                        ),
                                                                        itemBuilder: (BuildContext
                                                                                context,
                                                                            int itemIndex,
                                                                            int pageViewIndex) {
                                                                          return InkWell(
                                                                              onTap: () {
                                                                                _listingHistoryViewModel.listingHistoryViewModel(url: 'StreetNumber:${response.response!.docs![index].unparsedAddress!.split(' ').first}* AND StreetName:${response.response!.docs![index].unparsedAddress!.split(' ').last}*');
                                                                                print('URL==StreetNumber:${response.response!.docs![index].unparsedAddress!.split(' ').first}* AND StreetName:${response.response!.docs![index].unparsedAddress!.split(' ').last}*');
                                                                                Get.to(PropertyDetailScreen(
                                                                                  docs: response.response!.docs![index],
                                                                                ));
                                                                                print('==num===${response.response!.docs![index].unparsedAddress!.split(' ').first}');

                                                                                // Get.toNamed(
                                                                                //     NamedRoutes.routePropertyDetail,
                                                                                //     arguments: {
                                                                                //       'mlsNumber': 'test',
                                                                                //       'access_token': BridgeAPIEndpoints.RESO_ACCESS_TOKEN
                                                                                //     });
                                                                              },
                                                                              child: Container(
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: '${response.response!.docs![index].mediaUrl![pageViewIndex]}',
                                                                                  fit: BoxFit.cover,
                                                                                  width: size.width,
                                                                                  height: size.height,
                                                                                  fadeInDuration: Duration(seconds: 0),
                                                                                  errorWidget: (_, url, error) => PlaceholderWidget(),
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
                                                                      gradient:
                                                                          LinearGradient(
                                                                              colors: [
                                                                        Color(0x7F191616)
                                                                            .withOpacity(0.1),
                                                                        Color(0x7F191616)
                                                                            .withOpacity(0.2)
                                                                      ])),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              15,
                                                                          vertical:
                                                                              3),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  '${response.response!.docs![index].unparsedAddress}',
                                                                                  maxLines: 1,
                                                                                  style: boldWhiteText20(
                                                                                    textColor,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${response.response!.docs![index].city}, ${response.response!.docs![index].country} ${response.response!.docs![index].postalCode}',
                                                                                  style: regularWhiteText14(textColor),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                3,
                                                                          ),
                                                                          Text(
                                                                            '\$${response.response!.docs![index].listPrice.toString().replaceAllMapped(reg, mathFunc).toString().split('.').first}',
                                                                            style:
                                                                                boldWhiteText30(textColor),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        '${response.response!.docs![index].bedroomsTotal} Bed | ${response.response!.docs![index].bathroomsTotalDecimal} Bath | ${response.response!.docs![index].daysOnMarket} DOM',
                                                                        style: regularWhiteText16(
                                                                            textColor),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  top: 10,
                                                                  right: 10,
                                                                  child: response
                                                                              .response!
                                                                              .docs![index]
                                                                              .mlsStatus !=
                                                                          'Active'
                                                                      ? Container(
                                                                          height:
                                                                              23,
                                                                          padding:
                                                                              EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                          ),
                                                                          decoration:
                                                                              rectangularAppBarBoxDecorationWithRadius(4),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text('${response.response!.docs![index].mlsStatus}', style: boldWhiteText12(textColor)),
                                                                          ),
                                                                        )
                                                                      : SizedBox(),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(
                                                  height: 8,
                                                );
                                              },
                                            ),
                                      controller.isLoading == true
                                          ? AbsorbPointer(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Center(
                                                  child: SpinKitFadingCircle(
                                                      color: accentColor),
                                                ),
                                              ),
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                      ),
              ],
            );
          }
        } else if (controller.getAdvanceSearchPropertyResponse.status ==
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
    );
  }

  @override
  void dispose() {
    _getAdvanceSearchPropertyViewModel.docs!.clear();
    _getAdvanceSearchPropertyViewModel.status = null;
    _getAdvanceSearchPropertyViewModel.sort = null;

    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[1]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[0]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[2]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.sortByChoiceChips[3]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.statusChoiceChips[1]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.statusChoiceChips[2]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.statusChoiceChips[3]['isSelected'] =
        false;
    _getAdvanceSearchPropertyViewModel.statusChoiceChips[0]['isSelected'] =
        false;

    super.dispose();
  }
}
