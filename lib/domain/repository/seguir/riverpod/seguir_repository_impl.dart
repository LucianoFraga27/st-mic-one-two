import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/seguir/riverpod/seguir_repository.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeguirRepositoryImpl implements SeguirRepository {


    final RestClient restClient;
  SeguirRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<dynamic> verificarSeSegue(String idUsuario) async {
     try {
      var sp = await SharedPreferences.getInstance();
      String meuId = sp.getString(LocalStorageKeys.idUsuario) ?? "0";
      log("Meu id: $meuId");
      log("Meu id do usuario que sigo ou não: $idUsuario");
      
      final Response(:data) = await restClient.auth.get('/v1/usuario/$meuId/verficaSeSegue/$idUsuario');
      return data;
    } on DioException catch (e) {
       return false;
    }

  }
}