import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';
class ChangePasswordProvider extends GetConnect {

  Future<dynamic> callChangePassword({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.changePassword, queryRequest,headers: headers);
    debugPrint('callChangePassword => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('callChangePassword => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}