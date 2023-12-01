import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';

abstract interface class TopRepository {

  Future<List<dynamic>> listarMusicasTop ();

}

class TopRepositoryImpl  implements TopRepository {

 final RestClient restClient;
  TopRepositoryImpl({
    required this.restClient,
  });

 @override
  Future<List> listarMusicasTop() async {
     try {
      final Response(:data) = await restClient.auth.get('/v1/musica/top');
      print(data);
      return data;
    } on DioException catch (e) {
       throw Exception('Falha ao buscar musicas top');
    }
  }


}