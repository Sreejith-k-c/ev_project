import 'dart:developer';

import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/presentation/login/view/loginpage.dart';
import 'package:flutter/material.dart';

import '../../../repository/api/registration/registration_service.dart';

class RegistrationController extends ChangeNotifier{
  void onRegistration(
    BuildContext context,String uname,String email,String phone,String Password){
      var data={"username":uname,"email":email,"phone_number":phone,"password":Password};
      RegisterService.postRegistration(data).then((recData) {
        log("$recData");
        if(recData["status"]==1){
          var message=recData["message"];
          AppUtils.oneTimeSnackBar(message, txtColor: Colors.green, context: context);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>LoginPage()));
        }else{
          if(recData["message"]!="faild") {
            var message=recData["message"];
            AppUtils.oneTimeSnackBar(message, txtColor: Colors.red,context: context);
          }else{
            var message=recData["message"];
            AppUtils.oneTimeSnackBar(message, txtColor: Colors.red,context: context);
          }
        }
      });
    }
}