
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_riverpod_repository.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicaRiverpodRepositoryImpl implements MusicaRiverpodRepository {
  
    final RestClient restClient;
  MusicaRiverpodRepositoryImpl({
    required this.restClient,
  });

  
  @override
  Future encontrarMusicaPeloId(int id) async {
   try {
      final sp = await SharedPreferences.getInstance();
      final Response(:data) = await restClient.auth.get('/v1/musica/$id');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musica com $id');
    }
  }

  @override
  Future<List> listarMusicasDoUsuario(int idUsuario) async {
     try {
      final Response(:data) = await restClient.auth.get('/v1/musica/usuario/$idUsuario');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas do usuario');
    }
  }
}