import 'dart:developer';

import 'package:ev_project/repository/api/my_booking/model/my_booking_model.dart';
import 'package:ev_project/repository/api/my_booking/service/my_booking_service.dart';
import 'package:flutter/material.dart';

class MybookingController with ChangeNotifier{
  late MybookingModel mybookingModel=MybookingModel();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      MybookingService.fetchMybooking().then((recData){
        log("***************************************** $recData");
        if (recData["status"]==1) {
          mybookingModel=MybookingModel.fromJson(recData);
          isLoading=false;
        } else {
          log("else");
        }
        notifyListeners();
      });
    }catch(e) {
      log("$e");
    }
  }
}