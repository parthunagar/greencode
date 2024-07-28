import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';

class ForgotPasswordProvider extends GetConnect {
  Future<dynamic> callForgotPassword(String residentId,String email,String language) async {
    final response = await post(Api.forgotPasswordUrl,{
      'resident_id' : residentId,
      'email' : email,
      'language_key': language,
    });
    if(response.status.hasError) {
      debugPrint('forgotPassword => response.body : ${response.body}');
      debugPrint('forgotPassword => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callForgotPassword => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
