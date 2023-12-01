import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PesquisaRepository {
  Future<List<dynamic>> pesquisarMusica(String pesquisa);
}

class PesquisaRepositoryImpl implements PesquisaRepository {
  final RestClient restClient;
  PesquisaRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<List> pesquisarMusica(String pesquisa) async {
    try {
      pesquisa = pesquisa == "" || pesquisa == null ? "a" : pesquisa;
      final Response(:data) =
          await restClient.auth.get('/v1/musica/pesquisar/$pesquisa');
      print(data);
      return data;
    } on DioException catch (e) {
      throw Exception('Falha ao buscar musicas pesquisada');
    }
  }
}
