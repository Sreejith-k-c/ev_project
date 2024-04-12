import 'dart:developer';
import 'package:ev_project/repository/api/profile/model/profile_model.dart';
import 'package:ev_project/repository/api/profile/service/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileController with ChangeNotifier{
  late ProfileModel profileModel=ProfileModel();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      ProfileService.fetchProfile().then((recData){
        log("$recData");
        if (recData["status"]==1) {
          profileModel=ProfileModel.fromJson(recData);
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