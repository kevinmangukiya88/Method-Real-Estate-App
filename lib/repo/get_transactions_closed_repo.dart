import 'dart:developer';
import 'package:agentapp/models/responseModel/get_transaction_closed_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetTransactionClosedRepo extends APIService {
  static Future<GetCloseTransactionResponseModel> getTransactionClosedRepo(
      {String? type, int? num}) async {
    var response = await APIService().getResponse(
      url:
          '${APIEndpoints.TRANSACTIONS_CONTRACTS}pageNumber=$num&pageSize=10&status=$type',
      apitype: APIType.aGet,
    );
    print(
        'URl==${APIEndpoints.TRANSACTIONS_CONTRACTS}pageNumber=$num&pageSize=10&status=$type');
    log('GetTransactionsContractsRepo===>>>  $response');
    print('DAST=${response}');

    GetCloseTransactionResponseModel getTransactionClosedViewModel =
        GetCloseTransactionResponseModel.fromJson(response);
    return getTransactionClosedViewModel;
  }
}
