import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepositoryTemp {

  Future<bool> addUsernameAndFoto(String username, XFile? fotoPerfil, String id) async {
    print("foto perfil");
   print(fotoPerfil);
  
     String fotoPerfilPath = fotoPerfil?.path ?? "usuario-semfoto.png";



    Dio dio = Dio(BaseOptions(baseUrl: Environment.backendLOCAL));
     FormData formData = FormData.fromMap({
    'username': username,
    'fotoPerfil': await MultipartFile.fromFile(fotoPerfilPath),
  });

    var sp = await SharedPreferences.getInstance();
    var token = sp.getString(LocalStorageKeys.accessToken);

    try {
      final Response(:data) = await dio.post('/v1/usuario/$id', data: formData, options: Options(
      headers: {
        "Authorization": "Bearer $token", // Substitua pelo seu token de autorização
      }));
      print(data);
      return true;
     
    } catch (e) {
      print("Erro na solicitação: $e");
      return false;
    }
  }

}