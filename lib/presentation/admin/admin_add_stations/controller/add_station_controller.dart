import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../app_config/app_config.dart';
import '../../../../core/app_utils.dart';

class AddStationController extends ChangeNotifier{
  Future<void> addStation(
    BuildContext context,
    File? image,
    String stationname,
    String latitude,
    String longitude,
    String address,
    String operatinghours,
    String contact,
    String price
  ) async{
    try{
      var imageUrl="${AppConfig.baseurl}addStations/";
      onUploadImage(imageUrl,image,stationname,latitude,longitude,address,operatinghours,
      contact,price).then((
        response){
          log("${response.statusCode}");
          if(response.statusCode==201) {
            var message="station added";
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
  Future<http.Response> onUploadImage(
    String url,
    File? selectedImage,
    String stationname,
    String latitude,
    String longitude,
    String address,
    String operatinghours,
    String contact,
    String price,
  ) async {

    var token = await AppUtils.getAccessKey();
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = multiPartHeader(access: token);

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          selectedImage.path,
        ),
      );
    }

    request.fields['name'] = stationname;
    request.fields['latitude'] = latitude;
    request.fields['longitude'] = longitude;
    request.fields['address'] = address;
    request.fields['operating_hours'] = operatinghours;
    request.fields['contact_info'] = contact;
    request.fields['price'] = price;

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