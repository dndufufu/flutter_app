import 'dart:convert';

import "package:dio/dio.dart";
import 'package:flutter/services.dart';

class MockDataInterceptor extends Interceptor {
  static const _dir = 'assets/mock-data/';
  static const _extension = '.json';
  static var _bundle = PlatformAssetBundle();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = _dir + options.path + _extension;
    final data = await _bundle.loadString(resourcePath);
    final map = json.decode(data);
    var response =
        Response(data: map, statusCode: 200, requestOptions: options);
    handler.resolve(response);
  }
}
