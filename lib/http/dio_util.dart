
import 'package:dio/dio.dart';
import 'package:flutter_app/http/interceptor/mock_data.dart';

import 'api.dart';

Dio _dio = Dio();

Dio get dio => _dio;

class DioUtil {
  static Future init() async {
    dio.options.baseUrl = Api.BASE_URL;
    dio.options.connectTimeout = 5 * 1000;
    dio.options.sendTimeout = 5 * 1000;
    dio.options.receiveTimeout = 3 * 1000;

    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(MockDataInterceptor());
    // todo cookie
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path + "/dioCookie";
    // print('DioUtil : http cookie path = $tempPath');
    // var cj = PersistCookieJar(storage: FileStorage(tempPath));
    // dio.interceptors.add(CookieManager(cj));
  }

  static String parseError(error, {String defErrorString = '网络连接超时或者服务器未响应'}) {
    String? errStr;
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        errStr = defErrorString;
      } else {
        errStr = error.message;
      }
    }
    return errStr ?? defErrorString;
  }
}
