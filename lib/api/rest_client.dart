import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/interceptor.dart';
import '/environment.dart';

import 'package:dio/io.dart';                    //! Native   DioForNative
// import 'package:dio/browser.dart'; //! Browser  DioForBrowser

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          baseUrl: Environment.backendLOCAL,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor()
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
