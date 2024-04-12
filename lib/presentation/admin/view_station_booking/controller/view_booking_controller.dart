import 'dart:developer';
import 'package:ev_project/repository/api/view_station_bookings/model/view_bookingstation_model.dart';
import 'package:ev_project/repository/api/view_station_bookings/service/view_bookingstation_service.dart';
import 'package:flutter/material.dart';

class ViewBookingstationController with ChangeNotifier {
  late StationbookingModel stationbookingModel = StationbookingModel();
  bool isLoading = false;

  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    try {
      BookingstationService.fetchBookStation().then((recData) {
        log("my log" "$recData");
        print(recData["status"]);
        if (recData["status"] == 1) {
          stationbookingModel = StationbookingModel.fromJson(recData);
          log("my log" "converted");

          isLoading = false;
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
