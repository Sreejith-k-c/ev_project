import 'dart:developer';
import 'package:ev_project/core/app_utils.dart';
import 'package:ev_project/repository/helper/api_helper.dart';

class AddServicecenterService {
  static Future<dynamic> postService(Map<String, String> data) async {
    try {
      var encodedData = await ApiHelper.postService(
          endpoint: "addServiceCenter/", body: data,header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      var message = encodedData["message"];
      log("add serice -> $message");
      return encodedData;
    } catch (e) {
      log("$e");
    }
  }
}
