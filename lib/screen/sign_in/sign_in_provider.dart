import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class SignInProvider extends GetConnect {
  Future<dynamic> callLogin(String residentId,String password, String deviceToken,String language) async {
    final response = await post(Api.loginUrl,{
      'email' : residentId,
      'password' : password,
      'device_token' : deviceToken,
      'language_key': language,
    });
    if(response.status.hasError) {
      if(response.statusCode == 302) {
        Utils.clearSession();
      }
      debugPrint('LoginData => response.body : ${response.body}');
      debugPrint('LoginData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callLogin => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
