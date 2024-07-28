import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';

class BookingDetailsProvider extends GetConnect {
  Future<dynamic> callClubDetails(String apiToken, String language, int clubId) async {
    final response = await post(Api.clubDetails,
        {
      'language_key': language,
      'club_id': clubId,
    },
        headers: {
      'Authorization' : 'Bearer $apiToken'
    });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('ClubDetails => response.body : ${response.body}');
      debugPrint('ClubDetails => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callClubDetails => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

  Future<dynamic> callClubBooking(
      String apiToken,
      String language,
      int userId,
      int clubId,
      String date,
      String time,
      String adult,
      String children,
      String babies,
      String deviceToken) async {
    final response = await post(Api.clubBooking, {
      'user_id': userId,
      'club_id': clubId,
      'date': date,
      'time': time,
      'adult': adult,
      'child': children,
      'baby': babies,
      'device_token' : deviceToken,
      'language_key': language,
    }, headers: {
      'Authorization': 'Bearer $apiToken'
    });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('ClubBooking => response.body : ${response.body}');
      debugPrint('ClubBooking => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callClubBooking => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}