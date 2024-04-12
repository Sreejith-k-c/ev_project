import 'dart:developer';

import 'package:ev_project/repository/helper/api_helper.dart';

import '../../../../core/app_utils.dart';

class AssigneddelService {
  static Future<dynamic> fetchAssigneddelboy() async {
    try {
      var decodeData = await ApiHelper.getAssigneddelboy(
          endpoint: "assignDeliveryBoytoUser/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodeData;
    } catch (e) {
      log("$e");
    }
  }
}
