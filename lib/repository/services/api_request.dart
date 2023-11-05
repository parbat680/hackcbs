import 'dart:developer';
import 'dart:io';

import 'package:hackcbs/repository/handlers/user_repo.dart';
import 'package:http_parser/http_parser.dart';
import 'package:hackcbs/repository/handlers/error_handler.dart';
import 'package:dio/dio.dart';

class ApiBaseHelper {
  String url = "http://65.2.10.26:5000/api";
  Future post(String endpoint, Map<dynamic, dynamic> data) async {
    var dio = Dio();
    var responseJson;
    log(data.toString());
    UserRepository user = UserRepository();

    try {
      var response = await dio.post(
        "$url/$endpoint",
        data: data,
        options: Options(headers: {
          'content-type': 'application/json',
          'token': await user.getToken(),
        }),
      );
      log(response.data.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Connection!");
    }

    return responseJson;
  }

  Future get(String endpoint, String query) async {
    var dio = Dio();
    var responseJson;
    UserRepository user = UserRepository();
    log("$url/$endpoint/$query");
    log(await user.getToken());
    try {
      var response = await dio.get(
        "$url/$endpoint/$query",
        options: Options(headers: {
          'content-type': 'application/json',
          'auth-token': await user.getToken(),
        }),
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Connection!");
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    log(response.toString());
    switch (response.statusCode) {
      case 201:
      case 200:
        return response.data;
      case 400:
        throw BadRequestException("Route not found");
      case 401:
      case 403:
        throw UnauthorisedException("Session Expired, Login again");
      default:
        throw AppErrors(
            message: "Something went wrong", error: "unknown error");
    }
  }

  uploadImage(
    File file,
    Map<String, dynamic> mydata,
    String endpoint,
  ) async {
    String fileName = file.path.split('/').last;
    print(fileName);

    FormData data = FormData.fromMap(mydata);

    data.files.add(MapEntry(
        "image",
        await MultipartFile.fromFile(file.path,
            filename: fileName, contentType: MediaType('image', 'png'))));

    Dio dio = Dio();

    var response = await dio.post("$url/$endpoint",
        data: data, options: Options(headers: {}));

    return response.data;
  }
}
