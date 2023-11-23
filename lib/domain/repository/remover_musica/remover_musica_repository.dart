import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoverRepositoryTemp {
  Future<dynamic> removerMusica(String idMusica) async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Environment.backendLOCAL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60),
    ));

    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString(LocalStorageKeys.accessToken)?.toString() ?? '';
   
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    try {
      final Response response = await dio.delete('/v1/musica/$idMusica');
      log("Removido com sucesso");
      return true;
    } on DioError catch (e) {
      // Manipular erros de DioError aqui
      return false;
    }
  }
}