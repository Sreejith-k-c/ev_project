import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../repository/api/admin_view_station/model/admin_home_model.dart';
import '../../../../repository/api/admin_view_station/service/admin_home_service.dart';

class ViewStationController with ChangeNotifier {
  late StationsList stationsList = StationsList();
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    try {

  
      StationService.fetchStation().then((recData) {
        log("1234543234$recData");

    
        if (recData["status"] == 1) {
          stationsList = StationsList.fromJson(recData);
          isLoading = false;
        } else {
          log("else");
        }
        notifyListeners();
      });
    } catch (e) {
      log("$e");
      // throw e;
    }
  }
}
