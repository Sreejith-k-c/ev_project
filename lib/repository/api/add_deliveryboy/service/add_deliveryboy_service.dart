import 'dart:developer';
import 'package:ev_project/core/app_utils.dart';

import '../../../helper/api_helper.dart';

class AddDeliverboyService {
  static Future<dynamic> addDelboy(Map<String, String> data) async {
    try{
      var encodedData=await ApiHelper.addDelboys(
        endpoint: "addDeliveryBoy/",body: data,header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        var message=encodedData["message"];
        return encodedData;
    }catch(e) {
      log("$e");
    }
  }
}
