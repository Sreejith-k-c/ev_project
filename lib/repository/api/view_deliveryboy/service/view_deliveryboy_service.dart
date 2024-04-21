import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class ViewdeliveryboyService{
  static Future<dynamic> fetchViewdelboy() async{
    try {
      var decodeData=await ApiHelper.fetchViewdeliveryboy(
        endpoint: "addDeliveryBoy/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString()); 
        return decodeData;
    } catch (e) {
      log("$e");
    }
  }
}