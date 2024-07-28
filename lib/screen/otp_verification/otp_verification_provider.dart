import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class OtpVerificationProvider extends GetConnect {
  Future<dynamic> callOtpVerification(String residentId,String otp,String language) async {
    final response = await post(Api.verifyOtpUrl,{
      'resident_id' : residentId,
      'otp' : otp,
      'language_key': language,
    });
    if(response.status.hasError) {
      // if(response.statusCode == 302){
      //   Utils.clearSession();
      // }
      debugPrint('OtpVerification => response.body : ${response.body}');
      debugPrint('OtpVerification => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callOtpVerification => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
