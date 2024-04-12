import 'package:ev_project/repository/api/assign_deliveryboy/service/assign_deliveryboy_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_utils.dart';

class AssigndelboyController extends ChangeNotifier{
  void Assigndelboy(BuildContext context,String uname,String delboyname, String desaddress,String phone){
    var data={"username":uname,"deliveryboy_name":delboyname,"destination_address":desaddress,"phone_number":phone};
    AssigndelboyService.assignDelboy(data).then((recData){
      if (recData["status"]==1){
        var message="Deliveryboy Assigned";   
      AppUtils.oneTimeSnackBar(message,
            txtColor: Colors.green, context: context);  
    } else {
      var message="Deliveryboy not Assigned";
        AppUtils.oneTimeSnackBar(message,
              txtColor: Colors.red, context: context); 
    }
      });
    }
  }