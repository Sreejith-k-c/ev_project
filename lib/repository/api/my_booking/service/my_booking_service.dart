import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class MybookingService {
  static Future<dynamic> fetchMybooking() async{
    try{
      var decodeData=await ApiHelper.getBooking(
        endpoint: "user-booked-charging-stations/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
        return decodeData;
    }catch(e) {
      log("$e");
    }
  }
}