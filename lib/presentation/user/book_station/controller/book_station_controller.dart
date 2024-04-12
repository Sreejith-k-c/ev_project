import 'package:ev_project/repository/api/book_station/service/book_station_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_utils.dart';

class BookstationController extends ChangeNotifier {
  void BookStation(BuildContext context, String stationid, String email,String date,String time) {
    var data = {"charging_station": stationid, "email": email,"custom_book_time":date,"time":time};
    BookstationService.bookStations(data).then((recData) {
      if (recData["status"] == 1) {
        var message = "Booking completed";
        AppUtils.oneTimeSnackBar(message,
            txtColor: Colors.green, context: context);
      } else {
        var message="Booking failed";
        AppUtils.oneTimeSnackBar(message,
              txtColor: Colors.red, context: context); 
      }
    });
  }
}
