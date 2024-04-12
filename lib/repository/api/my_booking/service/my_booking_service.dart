import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class MybookingService{
  
  static Future<dynamic> fetchMybooking() async{
    try{
      var decodeData=await ApiHelper.getMybooking(
        endpoint: "user-booked-charging-stations/",
        // header: ApiHelper.getApiHeader(access: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEyOTAwNzAyLCJpYXQiOjE3MTI4MTQzMDIsImp0aSI6IjBlMDk3MTU4NTE3YjQzMjY4ZTE1OGE1Mjg2YjVlMzZmIiwidXNlcl9pZCI6Mn0.nqbi_v1OKH6rCv9MqOfhnf8hTiAjV-mMJSUmOXIVOs0" ));
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey().toString()));
        log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
        print("*******************serv res****************************************** ${decodeData}");
        return decodeData;
    }catch(e){
      log(" this the ser exe $e");
    }
  }




  // static Future<dynamic> fetchMybooking() async{
  //   try{
  //     var decodeData=await ApiHelper.getServiceCenter(
  //       endpoint: "user-booked-charging-stations/",
  //       header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
  //       log(ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
  //       return decodeData;
  //   }catch(e){
  //     log("$e");
  //   }
  // }

}