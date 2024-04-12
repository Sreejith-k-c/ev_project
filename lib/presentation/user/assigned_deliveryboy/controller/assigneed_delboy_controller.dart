import 'dart:developer';

import 'package:ev_project/repository/api/assigned_delboy/model/assigned_delboy_model.dart';
import 'package:ev_project/repository/api/assigned_delboy/service/assigned_delboy_service.dart';
import 'package:flutter/material.dart';

class AssigneddelboyController with ChangeNotifier{
  late AssignedDeliveryboyModel assignedDeliveryboyModel=AssignedDeliveryboyModel();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      AssigneddelService.fetchAssigneddelboy().then((recData){
        if(recData["status"]==1){
          assignedDeliveryboyModel=AssignedDeliveryboyModel.fromJson(recData);
          isLoading=false;
        }else{
          log("else");
        }
        notifyListeners();
      });
    }catch(e) {
      log("$e");
    }
  }
}