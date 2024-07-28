import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';
class ContactUsProvider extends GetConnect {
  Future<dynamic> callContactDetails(String apiToken,String language) async {
    final response = await post(Api.contactDetails, {
      'language_key': language,
    }, headers: {
      'Authorization': 'Bearer $apiToken'
    });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('ContactUs List => response.body : ${response.body}');
      debugPrint(
          'ContactUs List => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callContactUs => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

}