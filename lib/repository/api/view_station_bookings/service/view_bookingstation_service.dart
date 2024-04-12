import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class BookingstationService{
  static Future<dynamic> fetchBookStation() async{
    try{
      var decodeData=await ApiHelper.getStationBooking(
        endpoint: "bookedChargingStations/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
        return decodeData;
    }catch(e){
      log("$e");
    }
  }
}