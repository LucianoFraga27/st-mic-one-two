import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';
import 'package:mic_check_one_two/domain/repository/musica/repository/musica_add_repository.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicaAddRepository {
  Future<bool> adicionarMusica(String titulo, File arquivoAudio,
      XFile arquivoCapa, GeneroMusical genero) async {
    Dio dio = Dio(BaseOptions(baseUrl: Environment.backendLOCAL));
    var sp = await SharedPreferences.getInstance();
    String idUsuario = sp.getString(LocalStorageKeys.idUsuario).toString();
    var token = sp.getString(LocalStorageKeys.accessToken);
    FormData formData = FormData.fromMap({
      'id_usuario': idUsuario,
      'titulo': titulo,
      'genero': genero.name,
      'audio': await MultipartFile.fromFile(arquivoAudio.path,
          filename: 'audio.mp3'),
      'capa':
          await MultipartFile.fromFile(arquivoCapa.path, filename: 'capa.jpg'),
    });

    try {
      final Response(:data) = await dio.post('v1/musica',
          data: formData,
          options: Options(headers: {
            "Authorization":
                "Bearer $token", // Substitua pelo seu token de autorização
          }));
      print(data);
      return true;
    } catch (e) {
      print("Erro na solicitação: $e");
      return false;
    }
  }
}
