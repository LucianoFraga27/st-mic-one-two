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
  Future representacaoUsuario() async {
     try {
      final sp = await SharedPreferences.getInstance();
     String id = sp.getString(LocalStorageKeys.idUsuario) ?? "0";
     final Response(:data) = await restClient.auth.get("/v1/usuario/$id");
     print(data);
     return data;
     } on DioException catch (e, s) {
      return null;
     }
  }

}