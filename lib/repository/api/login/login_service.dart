import 'package:ev_project/repository/helper/api_helper.dart';

class LoginService{
  static Future<dynamic> postLogin(Map<String,String>data) async{
    try{
      var encodedData=
      await ApiHelper.postData(endpoint: "login/",body: data);
      if(encodedData["status"]==1) {
        return encodedData;
      }else{
        return encodedData;
      }
    }catch(e){
      print(e);
    }
  }
}