import 'package:flutter/material.dart';
import '../../../../core/app_utils.dart';
import '../../../../repository/api/book_service/service/book_service.dart';

class BookserviceController extends ChangeNotifier{
  void BookService(BuildContext context,String email, String stationname,String date, String time, String delboy) {
    var data={"email":email,"charging_station_name":stationname,"custom_book_time":date,"time":time,"need_delivery_boy":delboy};
    BookServiceService.bookService(data).then((recData){
      if (recData["status"]==1) {
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