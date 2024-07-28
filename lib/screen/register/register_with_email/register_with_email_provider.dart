import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';

class RegisterWithEmailProvider extends GetConnect {
  Future<dynamic> callRegisterWithEmail(String residentId,String email,String passcode, String password, String deviceToken,String language) async {
    final response = await post(Api.registerEmailUrl,{
      'resident_id' : residentId,
      'email' : email,
      'verify_code' : passcode,
      'password' : password,
      'device_token' : deviceToken,
      'language_key': language,
    });
    if(response.status.hasError) {
      debugPrint('RegisterEmailData => response.body : ${response.body}');
      debugPrint('RegisterEmailData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callRegisterEmailApi => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
