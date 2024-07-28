import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';

class EstateFundListProvider extends GetConnect {
  Future<dynamic> GetCategoryNoticeDetails(String apiToken, String language, String noticeId) async {
    final response = await post(Api.categoryNoticeDetailsList,
        {
      'language_key': language,
      'notice_category_id': noticeId,
    },
        headers: {
      'Authorization' : 'Bearer $apiToken'
    });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('CategoryNoticeDetails => response.body : ${response.body}');
      debugPrint('CategoryNoticeDetails => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callCategoryNoticeDetails => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}