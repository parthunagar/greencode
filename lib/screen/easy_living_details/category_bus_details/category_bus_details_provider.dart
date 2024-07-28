import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class CategoryBusDetailsProvider extends GetConnect {
  Future<dynamic> getBusDetails(String apiToken, String language , int stationId ) async {
    final response = await post(Api.busCmsDetails,
        {
          'language_key': language,
          'station_id': stationId,
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