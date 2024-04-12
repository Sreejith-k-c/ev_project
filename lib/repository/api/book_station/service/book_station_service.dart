
import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class BookstationService {
  static Future<dynamic> bookStations(Map<String,String>data) async{
    try{
      var encodedData=await ApiHelper.bookService(
        endpoint: "bookedChargingStations/",body: data,header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        var message=encodedData["message"];
        return encodedData;
    }catch(e) {
      log("$e");
    }
  }
}