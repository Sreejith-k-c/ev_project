import 'package:ev_project/repository/api/add_deliveryboy/service/add_deliveryboy_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_utils.dart';

class AddDeliveryboyController extends ChangeNotifier{
  void AddDeliveryboy(BuildContext context,String fname,String lname,String phone,String email, String address){
  var data={"first_name":fname,"last_name":lname,"phone_number":phone,"email":email,"address":address};
  AddDeliverboyService.addDelboy(data).then((recData){
    if (recData["status"]==1) {
      var message = "Deliveryboy added";    
      AppUtils.oneTimeSnackBar(message,
            txtColor: Colors.green, context: context);  
    } else {
      var message="Deliveryboy not added";
        AppUtils.oneTimeSnackBar(message,
              txtColor: Colors.red, context: context); 
    }
  });
}
}