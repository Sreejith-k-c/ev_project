import 'dart:developer';
import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class BookingserviceService{
  static Future<dynamic> fetchBookService() async{
    try{
      var decodeData=await ApiHelper.getServiceBooking(
        endpoint: "servicebook/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
        return decodeData;
    }catch(e){
      log("$e");
    }
  }
}