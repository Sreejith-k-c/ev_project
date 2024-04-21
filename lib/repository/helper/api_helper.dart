import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ev_project/app_config/app_config.dart';

class ApiHelper{
  static pstRegisterData({
    required String endpoint,
    Map<String,String>? header,
    required Map<String,dynamic> body,
  })async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body);
      log("${response.statusCode}");
      if(response.statusCode==201){
        var decodedData=jsonDecode(response.body);
        var data={
          "status":1,
          "message":"succsess",
          "data":decodedData
        };
        return data;
      }else if(response.statusCode==400) {
        var decodedData=jsonDecode(response.body);
        var data={
          "status":0,
          "message":"RegisteredUser Already Exist",
          "data":decodedData
        };
        return data;
      }else{
        var decodedData=jsonDecode(response.body);
        var data={
          "status":1,
          "message":"failed",
          "data":decodedData
        };
        return data;
      }
    }catch (e) {
      rethrow;
    }
  }

  static postData({
    required String endpoint,
    Map<String,String>? header,
    required Map<String,dynamic> body,
  }) async {
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body);
      if(response.statusCode==200){
        var decodedData=jsonDecode(response.body);
        return decodedData;
      }else{
        var decodedData=jsonDecode(response.body);
        var data={
          "status":0,
          "message":"failed",
          "data":decodedData
        };
        return data;
      }
    }catch (e){
      log("$e");
      rethrow;
    }
  }

  static getData({
    required String endpoint,
    Map<String,String>? header,
  }) async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      log("6666${response.statusCode}");
      if(response.statusCode==201){
        
        var decodeData=jsonDecode(response.body);
        log("0987654$decodeData");
        return decodeData;
      }else{
        print(response.body);
        log("error");
      }
    }catch(e){
      log("$e");
      rethrow;
    }
  }
   static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      log("access : $access");
      return {
        "Accept":"*/*",
          //  'Content-Type': 'application/json',
        'Authorization': "Bearer $access",
        
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

  static postService({
    required String endpoint,
    Map<String,String>? header,
    required Map<String,dynamic> body,
  })async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body,headers: header);
       log("${response.statusCode}");
      if(response.statusCode==201){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        var decodeData=jsonDecode(response.body);
        var data={
          "message":"failed"
        };
        return data;
      }
    }catch(e){
     log("$e");
      rethrow;
    }
  }

  static getServiceCenter({
    required String endpoint,
    Map<String,String>?header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url);
      if(response.statusCode==200){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        print(response.body);
      }
    }catch(e){
      rethrow;
    }
  }

  static bookService({
    required String endpoint,
    Map<String,String>?header,
    required Map<String,dynamic> body,
  }) async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body,headers: header);
      log("${response.statusCode}");
      if (response.statusCode==201) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        var decodeData=jsonDecode(response.body);
        var data={
          "message":"failed"
        };
        return data;
      }
    }catch(e){
      log("$e");
      rethrow;
    }
  }

  static bookServiceCenter({
    required String endpoint,
    Map<String,String>?header,
    required Map<String,dynamic> body,
  }) async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body,headers: header);
      log("${response.statusCode}");
      if (response.statusCode==201) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        var decodeData=jsonDecode(response.body);
        var data={
          "message":"failed"
        };
        return data;
      }
    }catch(e) {
      log("$e");
      rethrow;
    }
  }

  static addDelboys({
    required String endpoint,
  Map<String,String>?header,
  required Map<String,dynamic> body,
  }) async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body,headers: header);
      log("${response.statusCode}");
      if (response.statusCode==201) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        var decodeData=jsonDecode(response.body);
        var data={
          "message":"failed"
        };
        return data;
      }
    }catch(e){
      log("$e");
      rethrow;
    }
  }

  static getProdileData({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      log("${response.statusCode}");
      if(response.statusCode==200){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        print(response.body);
      }
    }catch(e){
      rethrow;
    }
  }

  static getServiceBooking({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      if(response.statusCode==200){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        print(response.body);
      }
    }catch(e){
      rethrow;
    }
  }

  static getStationBooking({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      if(response.statusCode==200){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        print(response.body);
      }
    }catch(e){
      rethrow;
    }
  }

  static getAssigneddelboy({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      if(response.statusCode==200){
        var decodeData=jsonDecode(response.body);
        return decodeData;
      }else{
        print(response.body);
      }
    }catch(e){
      rethrow;
    }
  }

  static assignDelBoy({
   required String endpoint,
   Map<String,String>? header,
   required Map<String,dynamic> body,
  })async{
     log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.post(url,body: body,headers: header);
      log("${response.statusCode}");
      if (response.statusCode==201) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        var decodeData=jsonDecode(response.body);
        var data={
          "message":"failed"
        };
        return data;
      }
    }catch(e){
      log("$e");
      rethrow;
    }
  }

  static getVehicle({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      log("${response.statusCode}");
      if (response.statusCode==201) {
        var decodeData=jsonDecode(response.body);
        log("$decodeData");
        return decodeData;        
      } else {
        print(response.body);
        log("error");
      }
    }catch(e) {
      log("$e");
      rethrow;
    }
  }

  static getBooking({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try{
      var response=await http.get(url,headers: header);
      if (response.statusCode==200) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        print(response.body);
      }
    }catch(e) {
      rethrow;
    }
  }

  static fetchViewdeliveryboy({
    required String endpoint,
    Map<String,String>? header,
  })async{
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try {
      var response=await http.get(url,headers: header); 
      if (response.statusCode==200) {
        var decodeData=jsonDecode(response.body);
        return decodeData;
      } else {
        print(response.body);
      }
    } catch (e) {
      rethrow; 
    }
  }
}