import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class CategoryBusStationListInfoProvider extends GetConnect {
  Future<dynamic> getBusStationList(String apiToken, String language) async {
    final response = await post(Api.busStationList,
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
      debugPrint('BusStationList => response.body : ${response.body}');
      debugPrint('BusStationList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callBusStationList => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}