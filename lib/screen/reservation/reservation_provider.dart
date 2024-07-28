import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class ReservationProvider extends GetConnect {
  Future<dynamic> callReservationClubList(String apiToken, String language, int userId) async {
    final response = await post(Api.reservationClubList,
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
      debugPrint('ReservationClubList => response.body : ${response.body}');
      debugPrint('ReservationClubList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callReservationClubList => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

  Future<dynamic> callCancelBooking(String apiToken, int userId,int bookingId, String status) async {
    final response = await post(Api.cancelBooking,
        {
          'user_id': userId,
          'booking_id': bookingId,
          'status': status,

        },
        headers: {
          'Authorization' : 'Bearer $apiToken'
        });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('CancelBooking => response.body : ${response.body}');
      debugPrint('CancelBooking => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callCancelBooking => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
