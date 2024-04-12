import 'dart:developer';
import 'package:ev_project/repository/api/view_service_booking/model/view_servicebooking_model.dart';
import 'package:ev_project/repository/api/view_service_booking/service/view_servicebooking_service.dart';
import 'package:flutter/material.dart';

class ViewservicebookingController with ChangeNotifier{
  late ServicebookingModel servicebookingModel=ServicebookingModel();
  bool isLoading=false;

  fetchData() async{
    isLoading=true;
    notifyListeners();
    try{
      BookingserviceService.fetchBookService().then((recData){
        log("$recData");
        if (recData["status"]==1) {
          servicebookingModel=ServicebookingModel.fromJson(recData);
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