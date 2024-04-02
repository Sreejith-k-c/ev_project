import 'package:ev_project/repository/helper/api_helper.dart';

class RegisterService {
  static Future<dynamic>postRegistration(Map<String,String>data) async{
    try{
      var encodedData=
      await ApiHelper.pstRegisterData(endpoint:"register/",body:data);
      var message=encodedData["message"];
      if(encodedData["status"]==1){
        return encodedData;
      }else{
        return encodedData;
      }
    }catch(e) {
      print(e);
    }
  }
}