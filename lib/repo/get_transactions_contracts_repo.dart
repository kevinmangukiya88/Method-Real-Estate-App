import 'dart:developer';
import 'package:agentapp/models/responseModel/get_smart_list_response_model.dart';
import 'package:agentapp/models/responseModel/get_transactions_contract_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/constants.dart';

class GetTransactionsContractsRepo extends APIService {
  static Future<GetTransactionsContractsResponseModel>
      getTransactionsContractsRepo({String? type, int? num}) async {
    var response = await APIService().getResponse(
      url:
          '${APIEndpoints.TRANSACTIONS_CONTRACTS}pageNumber=$num&pageSize=10&status=$type',
      apitype: APIType.aGet,
    );
    print(
        'URl==${APIEndpoints.TRANSACTIONS_CONTRACTS}pageNumber=$num&pageSize=10&status=$type');
    log('GetTransactionsContractsRepo===>>>  $response');
    print('DAST=${response}');

    GetTransactionsContractsResponseModel
        getTransactionsContractsResponseModel =
        GetTransactionsContractsResponseModel.fromJson(response);
    return getTransactionsContractsResponseModel;
  }
}
