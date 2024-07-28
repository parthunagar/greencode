import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class EasyLivingInfoProvider extends GetConnect {
  Future<dynamic> getEssentialList(String apiToken, String language) async {
    final response = await post(Api.essentialList,
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
      debugPrint('EssentialList => response.body : ${response.body}');
      debugPrint('EssentialList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callEssentialList => response.body : ${response.body}');
      return response.body;
    }
  }
}
//{'':''}