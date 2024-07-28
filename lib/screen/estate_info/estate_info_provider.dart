import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class EstateInfoListProvider extends GetConnect {
  Future<dynamic> callNoticeCategoryList(String apiToken, String language) async {
    final response = await post(Api.noticeCategoryListUrl,
        {
          'language_key': language,
        },
        headers: {
        'Authorization' : 'Bearer $apiToken'
        });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('NoticeCategoryList => response.body : ${response.body}');
      debugPrint('NoticeCategoryList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callNoticeCategoryList => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}