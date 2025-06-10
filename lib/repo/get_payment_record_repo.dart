import 'dart:developer';
import 'package:agentapp/models/responseModel/get_payment_record_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/constants.dart';

import '../viewModel/store_payment_data.dart';

class GetPaymentRecordRepo extends APIService {
  static Future<GetPaymentRecordResponseModel> getPaymentRecordRepo(
      {int? number}) async {
    var USERID = globalPreferences?.getString(AppPreferences.ID_USER);
    print(
        'URl==${APIEndpoints.TRANSACTIONS_CONTRACTS}$USERID/?pageSize=10&pageNumber=${number.toString()}');
    var response = await APIService().getResponse(
      url:
          '${APIEndpoints.PAYMENT_RECORDS}$USERID/?pageSize=10&pageNumber=${number.toString()}',
      apitype: APIType.aGet,
    );

    log('GetPaymentRecordRepo===>>>  $response');
    print('DAST=${response}');

    // StorePaymentData.storePaymentData.add(response);
    GetPaymentRecordResponseModel getPaymentRecordResponseModel =
        GetPaymentRecordResponseModel.fromJson(response);
    return getPaymentRecordResponseModel;
  }
}
