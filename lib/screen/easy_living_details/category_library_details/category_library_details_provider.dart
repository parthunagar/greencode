import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class CategoryLibraryDetailsProvider extends GetConnect {
  Future<dynamic> getLibraryDetails(String apiToken, String language) async {
    final response = await post(Api.libraryDetails,
        {
          'language_key': language,
        },
        headers: {
        'Authorization' : 'Bearer $apiToken'
        });
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('LibraryDetails => response.body : ${response.body}');
      debugPrint('LibraryDetails => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callLibraryDetails => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }
}
//{'':''}