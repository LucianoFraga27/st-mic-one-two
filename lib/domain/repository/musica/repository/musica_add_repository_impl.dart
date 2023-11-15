import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';
import 'package:mic_check_one_two/domain/repository/musica/repository/musica_add_repository.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicaAddRepository {
  @override
  Future<void> adicionarMusica(String titulo, File arquivoAudio, XFile arquivoCapa, GeneroMusical genero) async {
    
    print("titulo $titulo");
    print("genero $genero");
    
    print("arquivoAudio $arquivoAudio");
    print("arquivoCapa $arquivoCapa");

     Dio dio = Dio(BaseOptions(baseUrl: Environment.backendLOCAL,connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 60),));
     var sp = await SharedPreferences.getInstance();
     String idUsuario = sp.getString(LocalStorageKeys.idUsuario).toString();
     FormData formData = FormData.fromMap({
    'id_usuario': idUsuario,
    'titulo': titulo,
    'genero': genero.toString(),
    'audio': await MultipartFile.fromFile(arquivoAudio.path, filename: 'audio.mp3'),
    'capa': await MultipartFile.fromFile(arquivoCapa.path, filename: 'capa.jpg'),
  });

try {
   final Response(:data) = await dio.post('v1/musica', data: formData);
   print(data);
} on DioException catch (e) {
  if (e.response != null) {
    print('Erro na resposta: ${e.response!.data}');
    print('Status code: ${e.response!.statusCode}');
  } else {
    print('Erro na requisição: $e');
  }
} catch (e) {
  print('Erro desconhecido: $e');
}
  }
  
}