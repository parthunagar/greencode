import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';

class HomeProvider extends GetConnect {
  Future<dynamic> callAdvertisementList(
      String apiToken, String language) async {
    final response = await post(Api.getAdvertisementListUrl, {
      'language_key': language,
    }, headers: {
      'Authorization': 'Bearer $apiToken'
    });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('Advertisement List => response.body : ${response.body}');
      debugPrint(
          'Advertisement List => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callAdvertisementList => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

  // callGetTomorrowTempApi() {
  Future<dynamic> tempratureApi() async {
    final response = await get(Api.tempratureApi);
    if (response.status.hasError) {

      debugPrint('Weather List => response.body : ${response.body}');
      debugPrint(
          'Weather List => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callWeatherListApi => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

  // callGetTomorrowTempApi() {
    Future<dynamic> currentTempratureApi() async {
      final response = await get(Api.currentTempratureApi);
      if (response.status.hasError) {

        debugPrint('Weather List => response.body : ${response.body}');
        debugPrint(
            'Weather List => response.statusText : ${response.statusText}');
        return Future.error(response.statusText!);
      } else {
        debugPrint('callWeatherListApi => response.body : ${response.body}');
        // return Signin.fromJson(response.body) ;
        return response.body;
      }
    }
}
//{'':''}
