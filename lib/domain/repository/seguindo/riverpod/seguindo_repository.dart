import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SeguindoRepository {
  Future<List<dynamic>> listarMusicasDoSeguindo ();
}

class SeguindoRepositoryImpl implements SeguindoRepository{
  
     final RestClient restClient;
  SeguindoRepositoryImpl({
    required this.restClient,
  });

  
  @override
  Future<List> listarMusicasDoSeguindo() async {
     try {
      final sp = await SharedPreferences.getInstance();
      String idUsuario = sp.getString(LocalStorageKeys.idUsuario) ?? "1";
      final Response(:data) = await restClient.auth.get('/v1/musica/seguidos-mscs/$idUsuario');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas do seguindo');
    }
  }

}