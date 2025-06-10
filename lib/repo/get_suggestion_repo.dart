import 'package:agentapp/models/responseModel/get_suggestion_response_model.dart';
import 'package:agentapp/services/api_service/base_services.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/constants.dart';

class GetSuggestionRepo extends APIService {
  static Future<GetSuggestionResponseModel> getSuggestionRepo() async {
    var id = globalPreferences?.getString(AppPreferences.MARKET_ID);
    var response = await APIService().getResponse(
      url: '${APIEndpoints.SUGGESTION}$id',
      apitype: APIType.aGet,
    );
    print('URl==${APIEndpoints.SUGGESTION}$id');
    print('GetSuggestionRepo=${response}');

    GetSuggestionResponseModel getSuggestionResponseModel =
        GetSuggestionResponseModel.fromJson(response);
    return getSuggestionResponseModel;
  }
}
