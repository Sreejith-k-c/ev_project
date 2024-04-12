import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class ServiceCenterService{
  static Future<dynamic> fetchServiceCenter() async{
    try{
      var decodeData=await ApiHelper.getServiceCenter(
        endpoint: "addServiceCenter/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
        return decodeData;
    }catch(e){
      log("$e");
    }
  }
}