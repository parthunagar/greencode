import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class CategoryWetMarketDetailsProvider extends GetConnect {
  Future<dynamic> getWetMarketDetails(String apiToken, String language) async {
    final response = await post(Api.wetMarketDetails,
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
      debugPrint('WetMarketDetails => response.body : ${response.body}');
      debugPrint('WetMarketDetails => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callWetMarketDetails => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}