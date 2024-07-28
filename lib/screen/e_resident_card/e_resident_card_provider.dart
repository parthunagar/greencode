import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/utils/utils.dart';

class EResidentCardProvider extends GetConnect {
  Future<dynamic> getUserDetailByIdList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.userDetailById, queryRequest,headers: headers);
    if (response.status.hasError) {
      if(response.statusCode == 302){
        Utils.clearSession();
      }
      debugPrint('EssentialList => response.body : ${response.body}');
      debugPrint('EssentialList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callEssentialList => response.body : ${response.body}');
      return response.body;
    }
  }
}