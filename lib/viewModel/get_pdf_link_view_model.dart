import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:agentapp/models/responseModel/get_pdf_response_model.dart';
import 'package:agentapp/models/responseModel/get_transactions_contract_response_model.dart';
import 'package:agentapp/repo/get_pdf_link_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetPdfLinkViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');
  @override
  void onInit() {
    super.onInit();
  }

  GetPdfLinkResponseModel? response;
  List getPdf = [];
  List getPdfLink = [];
  List getThumbnailLink = [];
  List getPdfName = [];
  List checkLink = [];
  List CompleteLink = [];
  List completePdfName = [];
  List dd = ['d', 'd'];
  bool goBackPage = false;
  updateBreak() {
    goBackPage = true;
    dd.clear();
    print('SS${getPdf}');
    // getPdf.clear();
    // getPdfLink.clear();
    // getPdfName.clear();
    // getPdf.clear();
    // getThumbnailLink.clear();
    Get.back();
    update();
  }

  List<Map<String, dynamic>> finalList = [];

  // getLink({Contracts? data}) async {
  //   // getPdf.clear();
  //
  //   // response = null;
  //   for (int i = 0; i < data!.transactionDocuments!.length; i++) {
  //     if (data.transactionDocuments![i].fileSrc != null &&
  //         data.transactionDocuments![i].fileSrc!.isNotEmpty) {
  //       getPdf.add(data.transactionDocuments![i].fileSrc.toString());
  //       getPdfName.add(data.transactionDocuments![i].document?.name);
  //     }
  //   }
  //   print('ID==${getPdf.length}');
  //   // log('YES CONTAIN${indexMap}');
  //   if (indexMap.containsKey(data.id.toString())) {
  //     if (getPdf.length == indexMap['${data.id}']!['totalLink']) {
  //       indexMap['${data.id}']!['completeLink'].forEach((element) async {
  //         if (getPdf.contains(element)) {
  //           print('CONTAINLINK==${element}');
  //         } else {
  //           print('CONTAINLINK==11${element}');
  //
  //           // await getPdfLinkViewModel(pdfPath: element);
  //           // GetPdfLinkResponseModel dd = getPdfLinkResponse.data;
  //           // if (dd.status == 200) {
  //           //   response = getPdfLinkResponse.data;
  //           //   CompleteLink.add(element);
  //           //   print('LINK===${element}');
  //           //   getPdfLink.add(response!.data);
  //           //   getThumbnailLink.add(
  //           //       '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png');
  //           //   indexMap['${data.id}'] = {
  //           //     'pdfLink': getPdfLink,
  //           //     'pdfName': getPdfName,
  //           //     'totalLink': getPdf.length,
  //           //     'thumbLink': getThumbnailLink,
  //           //     'completeLink': CompleteLink
  //           //   };
  //           // }
  //         }
  //       });
  //     } else {
  //       // indexMap['${data.id}']!['completeLink'].forEach((element) async {
  //       //   if (getPdf.contains(element)) {
  //       //     print('CONTAINLINK==${element}');
  //       //   } else {
  //       //     await getPdfLinkViewModel(pdfPath: element);
  //       //     GetPdfLinkResponseModel dd = getPdfLinkResponse.data;
  //       //     if (dd.status == 200) {
  //       //       response = getPdfLinkResponse.data;
  //       //       CompleteLink.add(element);
  //       //       print('LINK===${element}');
  //       //       getPdfLink.add(response!.data);
  //       //       getThumbnailLink.add(
  //       //           '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png');
  //       //       indexMap['${data.id}'] = {
  //       //         'pdfLink': getPdfLink,
  //       //         'pdfName': getPdfName,
  //       //         'totalLink': getPdf.length,
  //       //         'thumbLink': getThumbnailLink,
  //       //         'completeLink': CompleteLink
  //       //       };
  //       //     }
  //       //   }
  //       // });
  //     }
  //   } else {
  //     // for (int i = 0; i < data.transactionDocuments!.length; i++) {
  //     //   if (data.transactionDocuments![i].fileSrc != null &&
  //     //       data.transactionDocuments![i].fileSrc!.isNotEmpty) {
  //     //     getPdf.add(data.transactionDocuments![i].fileSrc.toString());
  //     //     getPdfName.add(data.transactionDocuments![i].document?.name);
  //     //   }
  //     // }
  //     print('DEMO==${getPdfName.length}');
  //     print('DEMO11==${getPdf.length}');
  //     // if (indexMap.containsKey(data.id.toString())) {
  //     //   print('YES CONTAIN${indexMap['${data.id}']!['pdfLink']}');
  //     // } else {
  //     //   indexMap['${data.id}'] = {'pdfLink': getPdf, 'pdf Name': getPdfName,'totalLink':getPdf.length,};
  //     //   log('DAT==${indexMap}');
  //     // }
  //
  //     for (int j = 0; j < getPdf.length; j++) {
  //       await getPdfLinkViewModel(pdfPath: getPdf[j]);
  //       GetPdfLinkResponseModel dd = getPdfLinkResponse.data;
  //       if (dd.status == 200) {
  //         response = getPdfLinkResponse.data;
  //         CompleteLink.add(getPdf[j]);
  //         print('LINK===${getPdf[j]}');
  //         getPdfLink.add(response!.data);
  //         completePdfName.add(getPdfName[j]);
  //         getThumbnailLink.add(
  //             '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png');
  //         // indexMap.a({
  //         //   data.id.toString(): {
  //         //     'pdfLink': getPdfLink,
  //         //     'pdfName': completePdfName,
  //         //     'totalLink': getPdf.length,
  //         //     'thumbLink': getThumbnailLink,
  //         //     'completeLink': CompleteLink
  //         //   }
  //         // });
  //         indexMap['${data.id}'] = {
  //           'pdfLink': getPdfLink,
  //           'pdfName': completePdfName,
  //           'totalLink': getPdf.length,
  //           'thumbLink': getThumbnailLink,
  //           'completeLink': CompleteLink
  //         };
  //       }
  //       if (goBackPage) {
  //         break;
  //       }
  //       print('FINAl1==${indexMap}');
  //     }
  //   }
  //
  //   // Map<String, String> headers = {
  //   //   'Content-Type': 'application/json',
  //   //   'Authorization':
  //   //       'Bearer ${globalPreferences?.getString(AppPreferences.TOKEN)}'
  //   // };
  //   // StreamController<http.Response> responseStreamController =
  //   //     StreamController<http.Response>();
  //   //
  //   // Stream<http.Response> getResponses() async* {
  //   //   print('11');
  //   //   await Future.forEach(getPdf, (String apiUrl) async {
  //   //     http.Response response = await http.get(
  //   //         Uri.parse(
  //   //             "https://api.ourmethod.com/api/transactions/signed-url?src=${apiUrl}"),
  //   //         headers: headers);
  //   //     responseStreamController.add(response);
  //   //   });
  //   //   responseStreamController.close();
  //   // }
  //   //
  //   // await for (http.Response response in getResponses()) {
  //   //   if (response.statusCode == 200) {
  //   //     // Successful response, handle the data here
  //   //     var data = json.decode(response.body);
  //   //     print(data);
  //   //     checkLink.add(data['data']);
  //   //     print('FINAll=${checkLink}');
  //   //   } else {
  //   //     // Handle error responses
  //   //     print('Error: ${response.statusCode}');
  //   //   }
  //   // }
  //
  //   // List<Future<http.Response>> futures = [];
  //   // Map<String, String> headers = {
  //   //   'Content-Type': 'application/json',
  //   //   'Authorization':
  //   //       'Bearer ${globalPreferences?.getString(AppPreferences.TOKEN)}'
  //   // };
  //   // for (String apiUrl in getPdf) {
  //   //   futures.add(http.get(
  //   //       Uri.parse(
  //   //           "https://api.ourmethod.com/api/transactions/signed-url?src=${apiUrl}"),
  //   //       headers: headers));
  //   // }
  //   //
  //   // List<http.Response> responses = await Future.wait(futures);
  //   //
  //   // for (http.Response response in responses) {
  //   //   if (response.statusCode == 200) {
  //   //     // Successful response, handle the data here
  //   //     var data = json.decode(response.body);
  //   //     print('URL==${data}');
  //   //     checkLink.add(data['data']);
  //   //     print('DTA==${checkLink}');
  //   //   } else {
  //   //     // Handle error responses
  //   //     print('Error: ${response.statusCode}');
  //   //   }
  //   // }
  //   // if (finalList) {
  //   //   print('DATA CONTAIN');
  //   // } else {
  //   //   print('NOt');
  //   // }
  //   // for (int j = 0; j < getPdf.length; j++) {
  //   // await getPdfLinkViewModel(pdfPath: getPdf[j]);
  //   //   if (getPdfLinkResponse.status == Status.COMPLETE) {
  //   //     response = getPdfLinkResponse.data;
  //   //     getPdfLink.addIf(!getPdfLink.contains(response!.data), response!.data);
  //   //     val =
  //   //         '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png';
  //   //     getThumbnailLink.addIf(!getThumbnailLink.contains(val), val);
  //   //     checkLink.addIf(!checkLink.contains(getPdf[j]), getPdf[j]);
  //   //
  //   //     if (finalList.contains(data.id)) {
  //   //     } else {
  //   //       finalList.add({
  //   //         'id': '${data.id}',
  //   //         "pdfLink": getPdfLink,
  //   //         "thumImage": getThumbnailLink,
  //   //         "completeLink": checkLink,
  //   //         "pdfName": getPdfName,
  //   //       });
  //   //     }
  //   //
  //   //     // finalList.add({
  //   //     //   'id': '${data.id}',
  //   //     //   'pdfLink': getPdfLink,
  //   //     //   'thumImage':
  //   //     //       '${response!.data!.toString().split('.pdf').first.toString().replaceFirst('transaction_documents/', 'thumbnails/transaction_documents/')}.png'
  //   //     // });
  //   //   }
  //   //   // for (int k = 0; k < finalList.length; k++) {
  //   //   //   finalList[k]
  //   //   //       .addIf(finalList[k].containsKey(data.id), "pdfLink", getPdfLink);
  //   //   //   finalList[k].addIf(
  //   //   //       finalList[k].containsKey(data.id), "thumImage", getThumbnailLink);
  //   //   //
  //   //   //   print('DE==${finalList[k]['pdfLink']}');
  //   //   // }
  //   //   print('FINAL List==${finalList[0].toString()}');
  //   //   if (goBackPage) {
  //   //     break;
  //   //   }
  //   // }
  //
  //   update();
  // }

  ApiResponse get getPdfLinkResponse => _getSApiResponse;

  Future<void> getPdfLinkViewModel({String? pdfPath}) async {
    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      response = await GetPdfLinkRepo.getPdfLinkRepo(pdfPath: pdfPath);
      print("GetPdfLinkViewModel==>$response");

      _getSApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("GetPdfLinkViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
