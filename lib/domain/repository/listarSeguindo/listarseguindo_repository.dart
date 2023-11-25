import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ListarSeguindoRepository {
  Future<List<dynamic>> listarSeguindo (String idUsuario);

}

class ListarSeguindoRepositoryImpl implements ListarSeguindoRepository {
  
   final RestClient restClient;
  ListarSeguindoRepositoryImpl({
    required this.restClient,
  });

  
  @override
  Future<List> listarSeguindo(String idUsuario) async {
   try {
      final sp = await SharedPreferences.getInstance();
      final Response(:data) = await restClient.auth.get('/v1/usuario/$idUsuario/seguindo');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar seguindo do usuario com id:$idUsuario');
    }
  
  }

}