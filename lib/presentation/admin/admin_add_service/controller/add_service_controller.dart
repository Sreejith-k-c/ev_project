import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/app_utils.dart';
import '../../../../repository/api/add_service/service/add_service.dart';

class AddServiceController extends ChangeNotifier{

  void addServices(BuildContext context, String services, String centername,
      String address, String phone, String email) {
        var data={
          "services_offered" : services,
          "name" : centername,
          "address" : address,
          "phone_number" : phone,
          "email" : email
        };
        AddServicecenterService.postService(data).then((recData){
          log("$recData");
          if(recData["message"]=="Service Center added successfully"){
            var message = recData["message"];
          AppUtils.oneTimeSnackBar(message,
              txtColor: Colors.green, context: context); 
          }else{
            var message = recData["message"];
          AppUtils.oneTimeSnackBar(message,
              txtColor: Colors.red, context: context);
          }
        });
      }
}
