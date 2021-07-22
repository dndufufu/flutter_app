import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_app/http/dio_util.dart';

class PatientApi {
  static Future<Response> list() async {
    var response = dio.get("patient/");
    return response;
  }

  static Future<Response> index(String id) async {
    var response = dio.get("patient/$id");
    return response;
  }

  static Future<Response> update(String id) async {
    var response = dio.post("patient/$id", data: {});
    return response;
  }
}
