import 'dart:developer';
import 'dart:convert';
import 'package:ev_project/app_config/app_config.dart';
import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/presentation/user/BottomNavigation/view/bottomnav.dart';
import 'package:ev_project/repository/api/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../admin/admin_bottom/view/admin_bottom.dart';

class LoginController extends ChangeNotifier{
  late SharedPreferences sharedPreferences;
  void onLogin(BuildContext context,String username,String password) {
    var data={"username":username,"password":password};
    LoginService.postLogin(data).then((recData){
      log("fghghghj$recData");
      if(recData["status"]==1) {
        var data=recData["data"];
        var message=recData["message"];
        // AppUtils.oneTimeSnackBar(message,txtColor: Colors.green, context: context);
        log("======================${recData['is_admin']}");
       if (data["is_admin"]==1) {
         Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>AdminBottom()));
         
       } 
       else {
          Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>BottomNavBar()));
       }
          storeData(data);
          storeUserToken(data["token"]);
      }else{
        var message="Login failed";
        AppUtils.oneTimeSnackBar(message,txtColor: Colors.red, context: context);
      }
    });
  }
  storeUserToken(resData) async {
    log("StoreUserToken");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }
   storeData(data) async{
    sharedPreferences=await SharedPreferences.getInstance();
    String storeData=json.encode(data);
    sharedPreferences.setString(AppConfig.loginData,storeData);
    sharedPreferences.setBool(AppConfig.status,true);
   }
}