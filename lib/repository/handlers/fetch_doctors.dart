import 'dart:developer';

import 'package:hackcbs/models/doctorModel.dart';
import 'package:hackcbs/repository/services/api_request.dart';

class FetchDoctors {
  Future<List<Doctor>> getDoctors() async {
    List<Doctor> doctors = [];
    try {
      var response = await ApiBaseHelper().get('doctors', '');
      List data = response['doctor'];
      doctors = data.map((e) => Doctor.fromJson(e)).toList();

      log(doctors.toString());
      return doctors;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
