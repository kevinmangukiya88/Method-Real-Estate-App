import 'dart:async';
import 'package:agentapp/models/responseModel/get_agent_lookup_respopnse_model.dart';
import 'package:agentapp/repo/get_agent_lookup_repo.dart';
import 'package:agentapp/screens/agentLookup/agent_map_screen.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:label_marker/label_marker.dart';

class GetAgentLookupViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  Set<Marker> markers = {};
  int avgSales = 0;
  int avgListSum = 0;
  int totalSale = 0;
  bool finalShow = false;
  @override
  void onInit() {
    super.onInit();
  }

  bool showMap = false;
  updateMapview() {
    showMap = !showMap;
    update();
  }

  Set<Marker> markerss = {};
  List<Doc>? docsS = [];
  bool showMenuVisible = false;
  updateMenu(bool val) {
    print('VAKLO1=${val}');
    showMenuVisible = val;
    print('VAKLO=${showMenuVisible}');
    update();
  }

  setFullMapMarker(List<Doc>? doc) {
    docs!.forEach((element) {
      if (element.coordinates!.isEmpty) {
      } else {
        markerss.addLabelMarker(LabelMarker(
          label:
              millionShow('${element.listPrice.toString().split('.').first}'),
          markerId: MarkerId('${element.listingId}'),
          position: LatLng(double.parse(element.coordinates![1].toString()),
              double.parse(element.coordinates![0].toString())),
          backgroundColor: element.coordinates == 'Active' ||
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
            print('11');
            docsS!.clear();
            docsS!.add(element);
            updateMenu(true);
            update();
          },
        ));

        Future.delayed(Duration(seconds: 1), () {
          update();
          // val = true;
        });
      }
    });
  }

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  GetAgentLookUpResponseModel? response;
  GetAgentLookUpResponseModel? responseTwo;
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

  String? lifeTimeSales = '0';
  updateLifeTimeSales(String? val) {
    lifeTimeSales = val;
    update();
  }

  String? lastMonthDate = '0';
  updateLastMonthDate(String? val) {
    lastMonthDate = val;
    update();
  }

  String? pending = '0';
  updatePendingSales(String val) {
    pending = val;
    update();
  }

  String? avgSalesPrice = '0';
  updateSalesPrice(String val) {
    avgSalesPrice = val;
    update();
  }

  String? avgListPrice = '0';
  updateListPrice(String val) {
    avgListPrice = val;
    update();
  }

  String? totalVolume = '0';
  updateTotalVolume(String val) {
    totalVolume = val;
    update();
  }

  double lati = 44.50000;
  double longi = -89.50000;

  bool showmap = false;
  setMarker(List ress) {
    if (ress.isEmpty) {
      // markers.clear();
      update();
    } else {
      update();
      ress.forEach((element) {
        markers.addLabelMarker(LabelMarker(
          label: millionShow('${element['lable'].toString().split('.').first}'),
          markerId: MarkerId('${element['listingId']}'),
          position: LatLng(double.parse(element['cordinates'][1].toString()),
              double.parse(element['cordinates'][0].toString())),
          backgroundColor: element['mslStatus'] == 'Active' ||
                  element['mslStatus'] == 'coming soon'
              ? Colors.black
              : element['mslStatus'] == 'Closed'
                  ? Colors.white
                  : element['mslStatus'] == 'active under contract' ||
                          element['mslStatus'] == 'pending'
                      ? Colors.green
                      : element['mslStatus'] == 'expired' ||
                              element['mslStatus'] == 'withdrawn'
                          ? Colors.white
                          : Colors.black,
          textStyle: TextStyle(
            color: element['mslStatus'] == 'Active' ||
                    element['mslStatus'] == 'coming soon'
                ? Colors.white
                : element['mslStatus'] == 'Closed'
                    ? Colors.black
                    : element['mslStatus'] == 'active under contract' ||
                            element['mslStatus'] == 'pending'
                        ? Colors.white
                        : element['mslStatus'] == 'expired' ||
                                element['mslStatus'] == 'withdrawn'
                            ? Colors.green
                            : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
          draggable: false,
          consumeTapEvents: false,
          onTap: () {
            Get.to(AgentMapScreen(
              docs: docs,
            ));
            // docs!.clear();
            // docs!.add(element);
            // showMenuVisible = true;
          },
        ));
      });
    }
    update();
    Future.delayed(Duration(seconds: 2), () {
      update();
    });
  }

  ApiResponse get getAgentLifeTimeResponse => _getSApiResponse;

  Future<void> getAgentLookupViewModel({String? url}) async {
    var date = DateTime.now().subtract(Duration(days: 365));
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAgentLookUpResponseModel response =
          await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);
      updateLifeTimeSales(response.response!.numFound.toString());
      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetAgentLookupViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  ApiResponse _getClosedMonthResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getCloseMonthResponse => _getClosedMonthResponse;

  Future<void> getCloseMonthViewModel({String? url}) async {
    _getClosedMonthResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAgentLookUpResponseModel response =
          await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);
      updateLastMonthDate(response.response!.docs!.length.toString());
      for (int i = 0; i < response.response!.docs!.length; i++) {
        totalSale +=
            int.parse(response.response!.docs![i].closePrice.toString());
        updateTotalVolume(totalSale.toString());
      }

      _getClosedMonthResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetAgentLookupViewModel Error==>$e==");
      _getClosedMonthResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  ApiResponse _getPendingResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getPendingResponse => _getPendingResponse;

  Future<void> getPendingViewModel({String? url}) async {
    _getPendingResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAgentLookUpResponseModel response =
          await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);
      updatePendingSales(response.response!.docs!.length.toString());
      _getPendingResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetAgentLookupViewModel Error==>$e==");
      _getPendingResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  var avgSalSum = 0;
  dynamic avg;

  ApiResponse _getAvgSalesPriceResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getAvgSalesPriceResponse => _getAvgSalesPriceResponse;

  Future<void> getAvgSalesPriceViewModel(
      {String? url, String? urlSecond}) async {
    _getAvgSalesPriceResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAgentLookUpResponseModel response =
          await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);

      for (int i = 0; i < response.response!.docs!.length; i++) {
        avgSalSum +=
            int.parse(response.response!.docs![i].closePrice.toString());
      }
      avg = (avgSalSum / response.response!.docs!.length);

      updateSalesPrice(millionShow(avg.toString().split('.').first));

      _getAvgSalesPriceResponse = ApiResponse.complete(response);
    } catch (e) {
      _getAvgSalesPriceResponse = ApiResponse.error(message: 'error');
    } finally {}
  }

  var avgSalSum2 = 0;
  dynamic avg2;
  ApiResponse _getListPriceResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getAvgListPriceResponse => _getListPriceResponse;

  Future<void> getAvgListPriceViewModel({String? url}) async {
    _getListPriceResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetAgentLookUpResponseModel response =
          await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);

      for (int i = 0; i < response.response!.docs!.length; i++) {
        avgSalSum2 +=
            int.parse(response.response!.docs![i].closePrice.toString());
      }
      avg2 = (avgSalSum2 / response.response!.docs!.length);
      updateListPrice(millionShow(avg2.toString().split('.').first));

      _getListPriceResponse = ApiResponse.complete(response);
    } catch (e) {
      print("getAvgSalesPriceViewModel Error==>$e==");
      _getListPriceResponse = ApiResponse.error(message: 'error');
    } finally {
      if (_getAvgSalesPriceResponse.status == Status.COMPLETE ||
          _getAvgSalesPriceResponse.status == Status.ERROR) {}
      update();
    }
  }

  List<Doc>? docs = [];
  List<Map<String, dynamic>> cordinates = [];

  ApiResponse _getMapSalesResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getMapSalResponse => _getMapSalesResponse;

  Future<void> getMapSalesViewModel({String? url, String? secondUrl}) async {
    _getMapSalesResponse = ApiResponse.loading(message: 'Loading');
    try {
      response = await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);

      if (response!.response == null || response!.response!.docs!.isEmpty) {
      } else {
        for (int k = 0; k < response!.response!.docs!.length; k++) {
          cordinates.add({
            'lable': '${response!.response!.docs![k].listPrice}',
            'listingId': '${response!.response!.docs![k].listingId}',
            'cordinates': response!.response!.docs![k].coordinates,
            'mslStatus': response!.response!.docs![k].mlsStatus,
          });
          docs!.add(response!.response!.docs![k]);
        }
      }
      _getMapSalesResponse = ApiResponse.complete(response);
    } catch (e) {
      print("getAvgSalesPriceViewModel Error==>$e==");
      _getMapSalesResponse = ApiResponse.error(message: 'error');
    } finally {
      getMapListViewModel(url: secondUrl);
    }
  }

  ApiResponse _getMapListResponse =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get getMapListResponse => _getMapListResponse;

  Future<void> getMapListViewModel({String? url}) async {
    _getMapListResponse = ApiResponse.loading(message: 'Loading');
    try {
      response = await GetAgentLookUpRepo.getAgentLookUpRepo(url: url);
      if (response!.response == null || response!.response!.docs!.isEmpty) {
      } else {
        for (int k = 0; k < response!.response!.docs!.length; k++) {
          cordinates.add({
            'lable': '${response!.response!.docs![k].listPrice}',
            'listingId': '${response!.response!.docs![k].listingId}',
            'cordinates': response!.response!.docs![k].coordinates,
            'mslStatus': response!.response!.docs![k].mlsStatus,
          });
          docs!.add(response!.response!.docs![k]);
        }
        print('DOCLENGTH==${docs!.length}');
      }
      _getMapListResponse = ApiResponse.complete(response);
    } catch (e) {
      print("getAvgSalesPriceViewModel Error==>$e==");
      _getMapListResponse = ApiResponse.error(message: 'error');
    } finally {
      setMarker(cordinates);
    }
  }

  updateSS() {
    update();
  }
}
