import 'dart:async';
import 'package:agentapp/models/responseModel/get_suggestion_response_model.dart';
import 'package:agentapp/repo/get_suggestion_repo.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:get/get.dart';

class GetSuggestionViewModel extends GetxController {
  ApiResponse _getSApiResponse = ApiResponse.initial(message: 'Initialization');

  @override
  void onInit() {
    super.onInit();
  }

  ApiResponse get getSuggestionResponse => _getSApiResponse;
  List<City> citys = [];
  List<School> SchoolName = [];
  List schoolClip = [];
  List cityClip = [];
  Future<void> getSuggestionViewModel() async {
    citys.clear();
    SchoolName.clear();
    schoolClip.clear();

    _getSApiResponse = ApiResponse.loading(message: 'Loading');
    try {
      GetSuggestionResponseModel response =
          await GetSuggestionRepo.getSuggestionRepo();
      print("GetSuggestionViewModel==>$response");
      response.cities!.forEach((element) {
        citys.add(element);
      });
      response.zipCodes!.forEach((element) {
        citys.add(element);
      });
      response.schools!.elementarySchool!.forEach((element) {
        SchoolName.add(element);
      });
      response.schools!.highSchool!.forEach((element) {
        SchoolName.add(element);
      });
      response.schools!.middleSchool!.forEach((element) {
        SchoolName.add(element);
      });
    } catch (e) {
      print("GetSuggestionViewModel Error==>$e==");
      _getSApiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  Future<void> aupDate() async {
    update();
  }
}
