import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class ResetPasswordProvider extends GetConnect {
  Future<dynamic> callResetPassword(String password, String confirmPassword, String email,String language) async {
    final response = await post(Api.resetPasswordUrl,{
      'password' : password,
      'password_confirmation' : confirmPassword,
      'email' : email,
      'language_key': language,
    });
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('ResetPassword => response.body : ${response.body}');
      debugPrint('ResetPassword => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('Call Reset Password => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
