import 'package:agentapp/controllers/uiControllers/no_login_controller.dart';
import 'package:agentapp/models/responseModel/get_suggestion_response_model.dart';
import 'package:agentapp/screens/searchResults/search_result_screen.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/viewModel/get_advance_search_property_view_model.dart';
import 'package:agentapp/viewModel/get_suggestion_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import '../../utils/widgets.dart';

class AdvancedSearchScreen extends StatefulWidget {
  final bool? advance;
  const AdvancedSearchScreen({Key? key, this.advance}) : super(key: key);

  @override
  State<AdvancedSearchScreen> createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  @override
  void initState() {
    super.initState();
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
        child: AdvancedSearch(
      advance: widget.advance,
    ));
  }
}

class AdvancedSearch extends StatefulWidget {
  final bool? noLogin;
  final bool? advance;

  const AdvancedSearch({Key? key, this.noLogin, this.advance})
      : super(key: key);

  @override
  State<AdvancedSearch> createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {
  var isMLS = false.obs;
  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());
  NoLoginController _noLoginController = Get.put(NoLoginController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(height: 15),
          Row(
            children: [
              widget.advance == true
                  ? MyBackButton()
                  : GestureDetector(
                      onTap: () {
                        _noLoginController.advanced(false);
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
                '/Search',
                style: regularWhiteText12(accentColor),
              )
            ],
          ),
          verticalSpace(),
          Expanded(
              child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Advanced Search',
                    style: boldWhiteText24(accentColor),
                  )),
                  Obx(() {
                    return SweetButton(
                      onPressed: () {
                        isMLS.value = !isMLS.value;
                      },
                      child: Image.asset(
                        (isMLS.value)
                            ? 'assets/images/ic_mls.png'
                            : 'assets/images/ic_fmls.png',
                        height: 28,
                        width: 89,
                      ),
                    );
                  })
                ],
              ),
              verticalSpace(),
              AdvancedSearchFilterScreen(),
            ],
          )),
          verticalSpace(height: 20)
        ],
      ),
    );
  }
}

class AdvancedSearchFilterScreen extends StatefulWidget {
  final bool? showSearch;

  const AdvancedSearchFilterScreen({
    Key? key,
    this.showSearch,
  }) : super(key: key);

  @override
  State<AdvancedSearchFilterScreen> createState() =>
      _AdvancedSearchFilterScreenState();
}

class _AdvancedSearchFilterScreenState
    extends State<AdvancedSearchFilterScreen> {
  var carouselController = CarouselController();

  GetAdvanceSearchPropertyViewModel _getAdvanceSearchPropertyViewModel =
      Get.put(GetAdvanceSearchPropertyViewModel());
  GetSuggestionViewModel _suggestionViewModel =
      Get.put(GetSuggestionViewModel());

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

  bool isOneTap = false;

  String millionShow1(String str) {
    var result = NumberFormat.compact(locale: 'en').format(int.parse(str));

    return result;
  }

  TextEditingController _searchCityAndZipCode = TextEditingController();
  TextEditingController school = TextEditingController();

  @override
  void initState() {
    _suggestionViewModel.getSuggestionViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAdvanceSearchPropertyViewModel>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<GetSuggestionViewModel>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 52,
                        decoration:
                            rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                12, lightGreyColor, Colors.transparent),
                        child: SearchField(
                          suggestions: controller.schoolClip.length == 3
                              ? []
                              : controller.citys
                                  .map((e) => SearchFieldListItem<City>(
                                        e.name.toString(),
                                        child: Text(
                                          '${e.name}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                          searchInputDecoration: InputDecoration(
                            isDense: false,
                            counterText: '',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintText: '',
                            hintStyle: regularWhiteText14(
                                Colors.black.withOpacity(0.5)),
                          ),
                          controller: _searchCityAndZipCode,
                          marginColor: Colors.transparent,
                          suggestionItemDecoration: BoxDecoration(),
                          suggestionsDecoration: SuggestionDecoration(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              border:
                                  Border.all(color: Colors.black, width: 0.3)),
                          hint: 'City or Zip Code',
                          offset: Offset(0, 60),
                          suggestionState: Suggestion.hidden,
                          maxSuggestionsInViewPort: 3,
                          suggestionAction: SuggestionAction.unfocus,
                          onSuggestionTap: (item) {
                            controller.cityClip.add(item.searchKey);
                            controller.update();
                            _searchCityAndZipCode.text = item.searchKey;
                            _searchCityAndZipCode.clear();
                          },
                          readOnly: false,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 10,
                      spacing: 15,
                      children: [
                        ...List.generate(
                            controller.cityClip.length,
                            (index) => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${controller.cityClip[index]}'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.cityClip.removeAt(index);
                                          controller.update();
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                      ],
                    )
                  ],
                );
              },
            ),
            verticalSpace(height: 20),
            CustomChoiceChips(
              chipsData: controller.propertyChoiceChips,
              onSelected: (Map<String, dynamic> chipSelected) {
                controller.setPropertyType(chipSelected['title']);
              },
            ),
            verticalSpace(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleAndAnyCounter(
                          title: 'Bedrooms',
                          onChange: (count) {
                            controller.setTotalBedRoom(count.toString());
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleAndAnyCounter(
                          title: 'Bathrooms',
                          onChange: (count) {
                            controller.setTotalBathRoom(count.toString());
                          }),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Price Range',
                  style: regularWhiteText18(accentColor),
                ),
                Obx(
                  () {
                    return SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 0.001,
                      ),
                      child: RangeSlider(
                        values: controller.currentRangeValues.value,
                        min: 0,
                        max: 10000000,
                        divisions: int.parse(controller.firstVal!) < 1000000
                            ? 100000
                            : 20,
                        labels: RangeLabels(
                          '\$${millionShow(controller.currentRangeValues.value.start.round().toString())}',
                          '\$${millionShow(controller.lastVal.toString().split('.').first)}',
                        ),
                        onChanged: (RangeValues values) {
                          controller.currentRangeValues.value = values;
                          controller.firstVal = values.start
                              .toString()
                              .split('.')
                              .first
                              .toString();

                          double last = double.parse(values.end
                              .toString()
                              .split('.')
                              .first
                              .toString());

                          if (10000000 > last && last >= 9500000) {
                            controller.lastVal = 9500000.toString();
                          } else if (9500000 > last && last >= 9000000) {
                            controller.lastVal = 9000000.toString();

                            print('---last--last--9.5');
                          } else if (9000000 > last && last >= 8500000) {
                            controller.lastVal = 8500000.toString();
                            print('---last--last--9');
                          } else if (8500000 > last && last >= 8000000) {
                            controller.lastVal = 8000000.toString();
                            print('---last--last--8.5');
                          } else if (8000000 > last && last >= 7500000) {
                            controller.lastVal = 7500000.toString();
                            print('---last--last--8');
                          } else if (7500000 > last && last >= 7000000) {
                            controller.lastVal = 7000000.toString();
                            print('---last--last--7.5');
                          } else if (7000000 > last && last >= 6500000) {
                            controller.lastVal = 6500000.toString();
                            print('---last--last--7');
                          } else if (6500000 > last && last >= 6000000) {
                            controller.lastVal = 6000000.toString();
                            print('---last--last--6.5');
                          } else if (6000000 > last && last >= 5500000) {
                            controller.lastVal = 5500000.toString();
                            print('---last--last--6');
                          } else if (5500000 > last && last >= 5000000) {
                            controller.lastVal = 5000000.toString();
                            print('---last--last--6');
                          } else if (5000000 > last && last >= 4500000) {
                            controller.lastVal = 4500000.toString();
                            print('---last--last--6');
                          } else if (4500000 > last && last >= 4000000) {
                            controller.lastVal = 4000000.toString();
                            print('---last--last--6');
                          } else if (4000000 > last && last >= 3500000) {
                            controller.lastVal = 3500000.toString();
                            print('---last--last--6');
                          } else if (3500000 > last && last >= 3000000) {
                            controller.lastVal = 3000000.toString();
                            print('---last--last--6');
                          } else if (3000000 > last && last >= 2500000) {
                            controller.lastVal = 2500000.toString();
                            print('---last--last--6');
                          } else if (2500000 > last && last >= 2000000) {
                            controller.lastVal = 2000000.toString();
                            print('---last--last--6');
                          } else if (2000000 > last && last >= 1500000) {
                            controller.lastVal = 1500000.toString();
                            print('---last--last--6');
                          } else if (1500000 > last && last >= 1000000) {
                            controller.lastVal = 1000000.toString();
                            print('---last--last--6');
                          } else {
                            controller.lastVal =
                                last.toString().split('.').first;
                          }

                          try {
                            HapticFeedback.lightImpact();
                          } catch (e) {
                            // TODO
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basement',
                  style: regularWhiteText14(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                CustomChoiceChips(
                  chipsData: controller.basementChoiceChips,
                  onSelected: (Map<String, dynamic> chipSelected) {
                    controller.setBasement(chipSelected['title']);
                  },
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year Built',
                  style: regularWhiteText14(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                CustomChoiceChips(
                  chipsData: controller.yearBuiltChoiceChips,
                  onSelected: (Map<String, dynamic> chipSelected) {
                    print('YEARBUILT==${controller.yearBuilt}');
                    controller.setYearBuilt(
                        chipSelected['title'].toString().split('+').first);
                  },
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lot Size',
                  style: regularWhiteText14(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                CustomChoiceChips(
                  chipsData: controller.lotSizeChoiceChips,
                  onSelected: (Map<String, dynamic> chipSelected) {
                    controller.setLotSize(chipSelected['title']);
                  },
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subdivision/Building Name',
                  style: regularWhiteText14(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
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
                            child: MySearchableTextField(
                              suggestions: [],
                              onItemSelected: (item) {},
                              requireDensed: true,
                              hint: 'i.e, Meadow Downs or Centennnial',
                              verticalPad: 16,
                              horizontalPad: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Schools',
                  style: regularWhiteText14(accentColor,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                GetBuilder<GetSuggestionViewModel>(
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 52,
                            decoration:
                                rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                    12, lightGreyColor, Colors.transparent),
                            child: SearchField(
                              suggestions: controller.schoolClip.length == 3
                                  ? []
                                  : controller.SchoolName.map(
                                      (e) => SearchFieldListItem<City>(
                                            e.name.toString(),
                                            child: Text(
                                              '${e.name} : ${e.type.toString().toLowerCase().split('type.').last.toString().replaceAll('_', ' ')}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )).toList(),
                              searchInputDecoration: InputDecoration(
                                isDense: false,
                                counterText: '',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: '',
                                hintStyle: regularWhiteText14(
                                    Colors.black.withOpacity(0.5)),
                              ),
                              controller: school,
                              marginColor: Colors.transparent,
                              suggestionsDecoration: SuggestionDecoration(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  border: Border.all(
                                      color: Colors.black, width: 0.3)),
                              hint: 'Elementary/Middle/High School Name',
                              suggestionState: Suggestion.hidden,
                              maxSuggestionsInViewPort: 3,
                              offset: Offset(0, 60),
                              suggestionAction: SuggestionAction.unfocus,
                              onSuggestionTap: (item) {
                                controller.schoolClip.add(item.searchKey);
                                controller.update();
                                school.clear();
                              },
                              readOnly: false,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          runSpacing: 10,
                          spacing: 15,
                          children: [
                            ...List.generate(
                                controller.schoolClip.length,
                                (index) => Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              '${controller.schoolClip[index]}'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.schoolClip
                                                  .removeAt(index);
                                              controller.update();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                          ],
                        )
                      ],
                    );
                  },
                )
              ],
            ),
            verticalSpace(height: 20),
            widget.showSearch == true
                ? SweetButton(
                    onPressed: () {
                      if (_suggestionViewModel.cityClip.isEmpty) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text('Alert'),
                              content: Text('Please enter City or Zip Code!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        _getAdvanceSearchPropertyViewModel.res?.response?.docs =
                            [];
                        _getAdvanceSearchPropertyViewModel.updatePage();

                        _getAdvanceSearchPropertyViewModel.setFilter('listing');

                        controller.setFinalApiCall(
                            pagination: true, isLoading: true);
                      }
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
                : SweetButton(
                    onPressed: () {
                      if (_suggestionViewModel.cityClip.isEmpty) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text('Alert'),
                              content: Text('Please enter City or Zip Code!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        _getAdvanceSearchPropertyViewModel.updateString(true);
                        _getAdvanceSearchPropertyViewModel.res?.response?.docs =
                            [];
                        _getAdvanceSearchPropertyViewModel.currentPage = 1;

                        controller.setFinalApiCall(
                            pagination: true, isLoading: true);
                        _getAdvanceSearchPropertyViewModel
                            .setShowAllFilter(false);
                        Get.to(
                          SearchResultScreen(
                            pagination: true,
                            SearchDetail: _suggestionViewModel.cityClip.first,
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration:
                          rectangularAppBarBoxDecorationWithRadiusElevation(
                              40, 4),
                      child: CustomizedButton(
                        text: 'Search',
                        verticalPadding: 20,
                        textColor: textColor,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
