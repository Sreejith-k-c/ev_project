import 'dart:developer';

import 'package:ev_project/repository/api/my_vehicle/model/my_vehicle_model.dart';
import 'package:ev_project/repository/api/my_vehicle/service/my_vehicle_service.dart';
import 'package:flutter/material.dart';

class MyvehicleController with ChangeNotifier {
  late MyvehicleModel myvehicleModel=MyvehicleModel();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      MyvehicleService.fetchVehicle().then((recData){
        log("$recData");

        if (recData["status"]==1) {
          myvehicleModel=MyvehicleModel.fromJson(recData);
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