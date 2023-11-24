import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ListarSeguidoresRepository {
  Future<List<dynamic>> listarSeguidores (String idUsuario);

}

class ListarSeguidoresRepositoryImpl implements ListarSeguidoresRepository {
  
   final RestClient restClient;
  ListarSeguidoresRepositoryImpl({
    required this.restClient,
  });

  
  @override
  Future<List> listarSeguidores(String idUsuario) async {
   try {
      final sp = await SharedPreferences.getInstance();
      final Response(:data) = await restClient.auth.get('/v1/usuario/$idUsuario/seguidores');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar seguidores do usuario com id:$idUsuario');
    }
  return [];
  }

}