import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/usuario_repo.dart';
import 'package:dio/dio.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepoImpl implements UsuarioRiverpod {
  
  final RestClient restClient;
  UsuarioRepoImpl({
    required this.restClient,
  });
  
  @override
  Future representacaoUsuario(String id) async {
     try {
     final Response(:data) = await restClient.auth.get("/v1/usuario/$id");
     print(data);
     // satar genero preferido no local storage.
     return data;
     } on DioException catch (e, s) {
      return null;
     }
  }
  
  @override
  Future<List> listarSeguidoresDoUsuario(int id) async {
    try {
      final Response(:data) = await restClient.auth.get('/v1/usuario/$id/seguidores');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas do usuario');
    }
  }
  
  @override
  Future<List> listarSeguindoDoUsuario(int id) async {
    try {
      final Response(:data) = await restClient.auth.get('/v1/usuario/$id/seguindo');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas do usuario');
    }
  }

}