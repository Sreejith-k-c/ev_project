import 'dart:developer';
import 'dart:io';

import 'package:ev_project/app_config/app_config.dart';
import 'package:ev_project/core/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddVehicleController extends ChangeNotifier{
  Future<void> addVehicle(
    BuildContext context,
    File? image,
    String make,
    String model,
    String year,
    String battery,
    String Chargingtime
  )async{
    try{
      var imageUrl="${AppConfig.baseurl}addVehicle/";
      onUpload(imageUrl,image,make,model,year,battery,Chargingtime).then((
        response){
          log("${response.statusCode}");
          if(response.statusCode==201) {
            var message="Vehicle added";
            AppUtils.oneTimeSnackBar(message,txtColor: Colors.green, context: context);
          }else{
            

            log(response.body.toString());
            var message="failed";
            AppUtils.oneTimeSnackBar(message,txtColor: Colors.red, context: context);
          }
        });
    }
    catch(e){
      log("$e");
    }
  }
  
 Future<http.Response> onUpload(
    String imageUrl,
    File? image,
    String make,
    String model,
    String year,
    String battery,
    String chargingtime) async{
      
      var token=await AppUtils.getAccessKey();
      var request=http.MultipartRequest('POST',Uri.parse(imageUrl));
      Map<String,String> headers=multiPartHeader(access:token);

      if (image != null) {
      print("Image file size: ${image.lengthSync()} bytes <<<<<<<<<<<");
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'vehicle_image',
          image.path,
        ),
      );
    }
     request.fields['make'] = make;
    request.fields['model'] = model;
    request.fields['year'] = year;
    request.fields['battery_capacity'] = battery;
    request.fields['charging_time'] = chargingtime;

    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }
  static Map<String, String> multiPartHeader({String? access, String? dbName}) {
    log(access.toString());
    if (access != null) {
      return {
        "Content-type": "multipart/form-data",
        'Authorization': "Bearer $access"
      };
    } else if (dbName != null) {
      return {
        // 'Content-Type': 'application/json',
        'dbName': dbName
      };
    } else {
      return {
        // 'Content-Type': 'application/json',
      };
    }
    }
}