import 'package:dio/dio.dart';
import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class RepresentacaousuarioRepository {
  Future<dynamic> representacaoUsuario ();
}

class RepresentacaousuarioRepositoryImpl implements RepresentacaousuarioRepository{
   final RestClient restClient;
  RepresentacaousuarioRepositoryImpl({
    required this.restClient,
  });
  
  @override
  Future representacaoUsuario() async {
    try {
     var sp = await SharedPreferences.getInstance();
     var id = sp.getString(LocalStorageKeys.idUsuario);
     final Response(:data) = await restClient.auth.get("/v1/usuario/$id");
     print(data);
     // satar genero preferido no local storage.
     return data;
     } on DioException catch (e, s) {
      return null;
     }
  }
}