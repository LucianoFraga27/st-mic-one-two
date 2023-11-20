import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/listar_musicas_curtidas_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListarMusicasCurtidasRepositoryImpl implements ListarMusicasCurtidasRepository{
  
     final RestClient restClient;
  ListarMusicasCurtidasRepositoryImpl({
    required this.restClient,
  });
  
  @override
  Future<List> listarCurtidasDoUsuariox(int idUsuario) async{
   try {
      final Response(:data) = await restClient.auth.get('/v1/musica/listarMusicasCurtidas/$idUsuario');
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas curtidas');
    }
  }
 

}