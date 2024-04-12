
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../repository/api/view_cetner/model/view_model.dart';
import '../../../../repository/api/view_cetner/service/view_center_service.dart';

class ViewServiceCenterController  with ChangeNotifier{
  late ViewCenter viewCenter=ViewCenter();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      ServiceCenterService.fetchServiceCenter().then((recData){
        log("$recData");
        if (recData["message"]=="Service Center details fetched successfully") {
          viewCenter=ViewCenter.fromJson(recData);
          isLoading=false;
        } else {
          log("else");
        }
        notifyListeners();
      });
    }catch(e){
      log("$e");
    }
  }
}