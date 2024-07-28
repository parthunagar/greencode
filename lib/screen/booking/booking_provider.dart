import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';

class BookingProvider extends GetConnect {
  Future<dynamic> callClubList(String apiToken, String language, int userId) async {
    final response = await post(Api.clubList,
        {
      'language_key': language,
      'user_id': userId,
    },
        headers: {
      'Authorization' : 'Bearer $apiToken'
    });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('ClubList => response.body : ${response.body}');
      debugPrint('ClubList => response.body : ${response.statusCode}');
      debugPrint('ClubList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callClubList => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}