import 'dart:developer';
import 'package:ev_project/repository/helper/api_helper.dart';
import '../../../../core/app_utils.dart';

class StationService {
  static Future<dynamic> fetchStation() async {
    try {
      var decodeData = await ApiHelper.getData(
          endpoint: "addStations/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
              log( ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()).toString());
              log("12345432$decodeData");
      return decodeData;
    } catch (e) {
      
      log("$e");
    }
  }
}
