import 'dart:async';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart';
import 'package:agentapp/repo/get_advace_search_property_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/viewModel/get_suggestion_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:label_marker/label_marker.dart';

class GetAdvanceSearchPropertyViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  int currentPage = 1;

  updatePage() {
    currentPage = 1;
    update();
  }

  bool showIcon = false;
  changeShowIcon(bool val) {
    showIcon = val;
    update();
  }

  bool apiCal = false;
  String? url;
  String? shortFilter = 'listing';
  setFilter(String val) {
    shortFilter = val;
    update();
  }

  GetSuggestionViewModel _suggestionViewModel =
      Get.put(GetSuggestionViewModel());

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
    {'title': 'Active', 'isSelected': false},
    {'title': 'Closed', 'isSelected': false},
    {'title': 'Pending', 'isSelected': false},
    {'title': 'Expired', 'isSelected': false},
  ];
  List<Map<String, dynamic>> sortByChoiceChips = [
    {'title': 'Status', 'isSelected': true},
    {'title': 'Price', 'isSelected': false},
    {'title': 'DOM', 'isSelected': false},
    {'title': 'Modified', 'isSelected': false},
  ];
  var currentRangeValues = RangeValues(0, 10000000).obs;

  String? totalBedroom = '0';
  String? totalBathroom = '0';
  String? basement = 'All';
  String? yearBuilt = 'All';
  String? lotSize = 'All';
  String? firstVal = "0";
  String? lastVal = "10000000";
  String? propertyType = 'All';

  setTotalBedRoom(String? val) {
    totalBathroom = val;
    update();
  }

  setTotalBathRoom(String val) {
    totalBathroom = val;
    update();
  }

  setBasement(String val) {
    basement = val;
    update();
  }

  setYearBuilt(String val) {
    yearBuilt = val;
    print('YEAR==${yearBuilt}');
    update();
  }

  setLotSize(String val) {
    lotSize = val;
    update();
  }

  setRangFirstVal(String val) {
    firstVal = val;
    update();
  }

  setRangLastVal(String val) {
    lastVal = val;
    update();
  }

  setPropertyType(String val) {
    propertyType = val;
    update();
  }

  bool showAllFilter = false;
  setShowAllFilter(bool val) {
    showAllFilter = val;
    update();
  }

  String? singleUrl;
  setSingleUrl({String? val}) {
    singleUrl = val;
    update();
  }

  bool searchByAgentLookUp = false;
  checkAgentLookUp(bool val) {
    searchByAgentLookUp = val;
    update();
  }

  setFinalApiCall({
    bool? pagination,
    bool? isLoading,
  }) {
    ///City
    final List city = [];
    final List postal = [];
    var cityS;
    if (_suggestionViewModel.cityClip.length == 1) {
      cityS = _suggestionViewModel.cityClip
              .toString()
              .replaceAll(',', '')
              .replaceAll('[', '')
              .toString()
              .replaceAll(']', '')
              .isNumericOnly
          ? 'PostalCode:${_suggestionViewModel.cityClip.toString().replaceAll(',', '').replaceAll('[', '').toString().replaceAll(']', '')}'
          : 'City:${_suggestionViewModel.cityClip.toString().replaceAll(',', '').replaceAll('[', '').toString().replaceAll(']', '')}';
    } else {
      _suggestionViewModel.cityClip.forEach((element) {
        if (element.toString().isAlphabetOnly) {
          city.add(element);
        } else if (element.toString().isNumericOnly) {
          postal.add(element);
        }
      });
      if (city.isEmpty) {
        cityS =
            'PostalCode:(${postal.toString().replaceAll(',', '').toString().replaceAll('[', '').toString().replaceAll(']', '')})';
      } else if (postal.isEmpty) {
        cityS =
            'City:(${city.toString().replaceAll(',', '').toString().replaceAll('[', '').toString().replaceAll(']', '')})';
      } else {
        cityS =
            'City:(${city.toString().replaceAll(',', '').toString().replaceAll('[', '').toString().replaceAll(']', '')})  PostalCode:(${postal.toString().replaceAll(',', '').toString().replaceAll('[', '').toString().replaceAll(']', '')})';
      }
    }

    ///PropertySubType
    final property = propertyType == 'All'
        ? ''
        : propertyType == 'Town Home'
            ? 'AND PropertySubType:Townhouse'
            : propertyType == 'Condo'
                ? 'AND PropertySubType:Condominium'
                : propertyType == 'House'
                    ? 'AND PropertySubType:"Single Family Residence"'
                    : 'AND PropertySubType:${propertyType!}';

    ///TotalBedRoom AND TotalBathroom
    final totalBedroomS =
        totalBedroom == "0" ? '' : 'AND BedroomsTotal:[${totalBedroom} TO *]';

    final totalBathroomS = totalBathroom == "0"
        ? ''
        : 'AND BathroomsTotalDecimal:[${totalBathroom} TO *]';

    ///RangeSlider
    final range = firstVal == '0' && lastVal == '10000000'
        ? ''
        : 'AND ListPrice:[${firstVal.toString().split('.').first} TO ${lastVal.toString().split('.').first}]';

    ///Basement
    final basementS = basement == 'All' ? '' : 'AND Basement:$basement';

    ///YearBuilt
    final yearBuiltS =
        yearBuilt == 'All' ? '' : 'AND YearBuilt:[$yearBuilt TO *]';

    ///lotSize
    final lotSizeS = lotSize == 'All'
        ? ''
        : 'AND LotSizeAcres:[${lotSize.toString().split(' Acre+').first} TO *]';

    if (searchByAgentLookUp == true) {
      if (cityS == 'PostalCode:()') {
        getAdvanceSearchPropertyViewModel(
            url:
                '$singleUrl $property $range $totalBedroomS $totalBathroomS $basementS $yearBuiltS $lotSizeS',
            pagination: true,
            type: status,
            sorts: sort,
            isLoadings: isLoading);
      } else {
        getAdvanceSearchPropertyViewModel(
            url:
                '$singleUrl AND $cityS $property $range $totalBedroomS $totalBathroomS $basementS $yearBuiltS $lotSizeS',
            pagination: true,
            type: status,
            sorts: sort,
            isLoadings: isLoading);
      }
    } else {
      getAdvanceSearchPropertyViewModel(
          url:
              '$cityS $property $range $totalBedroomS $totalBathroomS $basementS $yearBuiltS $lotSizeS',
          pagination: true,
          type: status,
          sorts: sort,
          isLoadings: isLoading);
    }
  }

  // getUrl(String? val) {
  //   print('GET URL');
  //   setApiCall(url: val);
  //   update();
  // }

  setApiCall({String? url, bool? pagination}) {
    getAdvanceSearchPropertyViewModel(
        url: url, pagination: pagination, isLoadings: false);
  }

  bool isLoading = false;
  updateIsLoading(bool val) {
    isLoading = val;
    update();
  }

  String? fmls;

  updateString(bool val) {
    if (val == true) {
      fmls = 'fmls';
    } else {
      fmls = 'gamls2';
    }
    update();
  }

  Set<Marker> markers = {};

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

  List<Doc>? docs = [];
  bool showMenuVisible = false;

  changMenuVisi(bool val) {
    showMenuVisible = val;
    update();
  }

  String? status;
  String? sort;
  bool advanceFilter = false;
  updateAdvanceFilter(bool val) {
    advanceFilter = val;
    update();
  }

  updateStatus(String val) {
    status = val;
    update();
  }

  updateSort(String val) {
    sort = val;
    update();
  }

  setMarker(GetAdvanceSearchPropertyResponseModel ress) {
    if (ress.response == null) {
    } else {
      if (ress.response!.docs!.isEmpty) {
        markers.clear();
        update();
      } else {
        ress.response!.docs!.forEach((element) {
          markers.addLabelMarker(LabelMarker(
              label: millionShow(
                  '${element.listPrice.toString().split('.').first}'),
              markerId: MarkerId('${element.listingId}'),
              position: LatLng(double.parse(element.coordinates![1].toString()),
                  double.parse(element.coordinates![0].toString())),
              backgroundColor: element.mlsStatus == 'Active' ||
                      element.mlsStatus == 'coming soon'
                  ? Colors.black
                  : element.mlsStatus == 'Closed'
                      ? Colors.white
                      : element.mlsStatus == 'active under contract' ||
                              element.mlsStatus == 'pending'
                          ? Colors.green
                          : element.mlsStatus == 'expired' ||
                                  element.mlsStatus == 'withdrawn'
                              ? Colors.white
                              : Colors.black,
              textStyle: TextStyle(
                color: element.mlsStatus == 'Active' ||
                        element.mlsStatus == 'coming soon'
                    ? Colors.white
                    : element.mlsStatus == 'Closed'
                        ? Colors.black
                        : element.mlsStatus == 'active under contract' ||
                                element.mlsStatus == 'pending'
                            ? Colors.white
                            : element.mlsStatus == 'expired' ||
                                    element.mlsStatus == 'withdrawn'
                                ? Colors.green
                                : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
              draggable: false,
              consumeTapEvents: true,
              onTap: () {
                docs!.clear();
                docs!.add(element);
                showMenuVisible = true;
                update();
              }));
          update();
        });
      }
    }

    update();
  }

  ApiResponse get getAdvanceSearchPropertyResponse => _getSApiResponse;
  GetAdvanceSearchPropertyResponseModel? res;

  Future<void> getAdvanceSearchPropertyViewModel(
      {String? url,
      isLoadings = true,
      bool? pagination,
      String? type,
      String? sorts,
      String? mslStatus}) async {
    updateIsLoading(true);
    if (isLoadings) {
      _getSApiResponse = ApiResponse.loading(message: 'Loading');
    }
    if (pagination == true) {
      GetAdvanceSearchPropertyResponseModel response =
          await GetAdvanceSearchPropertyRepo.getAdvanceSearchPropertyRepo(
              type: fmls,
              url: url,
              sort: sort,
              pages: currentPage,
              pagination: pagination,
              mslStatus: status);
      if (currentPage == 1) {
        res = response;
      } else {
        if (response.response == null || response.response == []) {
        } else {
          response.response!.docs!.forEach((element) {
            if (response.response!.docs!.isNotEmpty) {
              res?.response!.docs!.add(element);
            }
          });
        }
      }
      if (response.response != null && response.response!.docs!.length >= 10) {
        currentPage++;
      }
      setMarker(response);
      _getSApiResponse = ApiResponse.complete(response);
      updateIsLoading(false);

      update();
    } else {
      GetAdvanceSearchPropertyResponseModel response =
          await GetAdvanceSearchPropertyRepo.getAdvanceSearchPropertyRepo(
              url: url,
              pages: currentPage,
              pagination: pagination,
              type: fmls,
              sort: sort,
              mslStatus: status);
      res = response;
      setMarker(response);
      _getSApiResponse = ApiResponse.complete(response);
      updateIsLoading(false);
      update();
    }
  }

  Future<void> aupDate() async {
    update();
  }
}
