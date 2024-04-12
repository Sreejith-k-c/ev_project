import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class BookServiceService{
  static Future<dynamic> bookService(Map<String,String>data) async{
    try{
      var encodedData=await ApiHelper.bookServiceCenter(
        endpoint: "servicebook/",body: data,header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
        var message=encodedData["message"];
        return encodedData;
    }catch(e){
      log("$e");
    }
  }
}