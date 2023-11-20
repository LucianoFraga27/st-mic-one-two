import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_repository.dart';

class CurtidaOuNaoRepositoryImpl implements CurtidaOuNaoRepository{
  
  final RestClient restClient;
  CurtidaOuNaoRepositoryImpl({
    required this.restClient,
  });

  
  @override
  Future<bool> curtiuOuNao(int idMusica) async {
     try {
      final Response(:data) = await restClient.auth.get('/v1/musica/curtiuounao/$idMusica');
      return data;
    } on DioException catch (e) {
       return false;
    }
  }
}