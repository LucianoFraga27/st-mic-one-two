import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeguirUsuarioRepositoryTemp {
  Future<dynamic> seguir(String idUsuarioASerSeguido) async {
    Dio dio = Dio(BaseOptions(
      baseUrl: Environment.backendLOCAL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60),
    ));

    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString(LocalStorageKeys.accessToken)?.toString() ?? '';
    String seguidorId = sp.getString(LocalStorageKeys.idUsuario)?.toString() ?? '';
  
    // Configuração do interceptor para adicionar o cabeçalho de autorização
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));

    try {
      final Response response = await dio.post('/v1/usuario/$seguidorId/seguir2/$idUsuarioASerSeguido');
      log("Seguir: ----------> $response");
      return response.data;
    } on DioError catch (e) {
      // Manipular erros de DioError aqui
      return "Ocorreu um erro";
    }
  }
}