import 'dart:developer';

import 'package:hackcbs/repository/services/api_request.dart';

class AddMedicine {
  static Future add(image, data) async {
    var response = await ApiBaseHelper().uploadImage(image, data, "medicines");
    log(response['token']);

    return true;
  }
}
