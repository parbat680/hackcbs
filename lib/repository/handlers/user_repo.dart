import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:hackcbs/repository/services/api_request.dart';

class UserRepository {
  Future signUp(
      {required String firstname,
      required String lastname,
      required String dob,
      required String gender,
      required String username,
      required String email,
      required String password}) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("username : $username, phone: $phone, password: $password");

    try {
      var response = await ApiBaseHelper().post('patients/register', {
        "firstName": firstname,
        "lastName": lastname,
        "dateOfBirth": dob,
        "gender": gender,
        "username": username,
        "email": email,
        "password": password
      });
      log(response.toString());
      log(response['token']);
      persistToken(response['token']);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future login(String email, String password) async {
    try {
      var response = await ApiBaseHelper()
          .post('patients/login', {"email": email, "password": password});
      log(response['token']);
      persistToken(response['token']);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future persistToken(String token) async {
    GetStorage box = GetStorage();
    box.write('token', token);
  }

  Future deleteToken() async {
    GetStorage box = GetStorage();
    box.remove('token');
  }

  Future hasToken() async {
    GetStorage box = GetStorage();
    if (box.read('token') != null) {
      return true;
    }
    return false;
  }

  Future getToken() async {
    GetStorage box = GetStorage();
    return box.read('token');
  }
}
