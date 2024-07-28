import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class RegisterProvider extends GetConnect {
  Future<dynamic> callRegisterApi(String residentId,String deviceToken,String language) async {
    final response = await post(Api.registerUrl,{
      'resident_id' : residentId,
      'device_token' : deviceToken,
      'language_key': language,
    });
    if(response.status.hasError) {
      // if(response.statusCode == 302){
      //   Utils.clearSession();
      // }
      debugPrint('registerData => response.body : ${response.body}');
      debugPrint('registerData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callRegister => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }


}
