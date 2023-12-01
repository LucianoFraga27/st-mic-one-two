import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PraVoceRepository {

  Future<List> listarByGenero();

}

class PraVoceRepositoryImpl  implements PraVoceRepository {

 final RestClient restClient;
  PraVoceRepositoryImpl({
    required this.restClient,
  });

 @override
  Future<List> listarByGenero() async {
    try {
      final sp = await SharedPreferences.getInstance();
      var genero = sp.getString(LocalStorageKeys.generoFavorito);
      final Response(:data) = await restClient.auth.get('/v1/musica/genero/$genero');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musica de genero');
    }
  }


}