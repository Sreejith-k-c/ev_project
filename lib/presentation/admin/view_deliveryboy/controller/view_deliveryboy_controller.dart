import 'dart:developer';

import 'package:ev_project/repository/api/view_deliveryboy/service/view_deliveryboy_service.dart';
import 'package:flutter/material.dart';

import '../../../../repository/api/view_deliveryboy/model/view_deliveryboy_model.dart';

class ViewdeliveryboyController with ChangeNotifier {
  late ViewDeliveryboyModel viewDeliveryboyModel=ViewDeliveryboyModel();
  bool isLoading=false;

  Future fetchData() async{
    isLoading=true;
    notifyListeners();
    try {
      ViewdeliveryboyService.fetchViewdelboy().then((recData){
        log("$recData");
        if (recData["status"]==1) {
          viewDeliveryboyModel=ViewDeliveryboyModel.fromJson(recData);
          isLoading=false;
        } else {
          log("else");
        }
        notifyListeners();
      }); 
    } catch (e) {
      log("$e");
    }
  }
}