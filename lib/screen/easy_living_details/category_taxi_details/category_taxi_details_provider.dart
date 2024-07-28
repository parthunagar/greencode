import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class CategoryTaxiDetailsProvider extends GetConnect {
  Future<dynamic> getTaxiDetails(String apiToken, String language) async {
    final response = await post(Api.taxiDetails,
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
      debugPrint('TaxiDetails => response.body : ${response.body}');
      debugPrint('TaxiDetails => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callTaxiDetails => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}