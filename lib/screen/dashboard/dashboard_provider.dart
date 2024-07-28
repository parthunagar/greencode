import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';

class DashboardProvider extends GetConnect {
  Future<dynamic> callLogOut(String apiToken) async {
    final response = await get(Api.logoutUrl,
    //     {
    //   '':'',
    // },
        headers: {
      'Authorization' : 'Bearer $apiToken'
    });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('Logout => response.body : ${response.body}');
      debugPrint('Logout => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callLogOut => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }


  Future<dynamic> callChangeLanguageApi(int userId,String language,String apiToken) async {
    final response = await post(Api.changeLanguage,{
      'user_id' : userId,
      'language_key': language,
    },   headers: {
      'Authorization' : 'Bearer $apiToken'
    });
    if(response.status.hasError) {
      // if(response.statusCode == 302){
      //   Utils.clearSession();
      // }
      debugPrint('changeLanguageData => response.body : ${response.body}');
      debugPrint('changeLanguageData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callChangeLanguage => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

}
//{'':''}