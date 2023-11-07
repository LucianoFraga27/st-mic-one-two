import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepositoryTemp {
  Future<bool> login(String email, String password) async {
    Dio dio = Dio(BaseOptions(baseUrl: Environment.backendLOCAL,connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 60),));

    final Map<String, dynamic> json = {
      "login": email,
      "password": password,
    };

    try {
      final Response(:data) = await dio.post('/v1/auth/login', data: json);
      print(data);
      if (data['access_token'] != null) {
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKeys.accessToken, data['access_token']);
        String token =  await sp.getString(LocalStorageKeys.accessToken).toString();
        Map<String, dynamic> payload = Jwt.parseJwt(token);
        sp.setString(LocalStorageKeys.idUsuario, payload['user']['id'].toString());
        sp.setString(LocalStorageKeys.usernameUsuario, payload['user']['username'].toString());
        // print(sp.getString(LocalStorageKeys.idUsuario));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Erro na solicitação: $e");
      return false;
    }
  }

  Future<dynamic> register(String email, String password) async {
    Dio dio = Dio(BaseOptions(baseUrl: Environment.backendLOCAL));

    final Map<String, dynamic> json = {
      "login": email,
      "password": password,
      "role": "USER",
    };
    print(json);
    try {
      final Response(:data) = await dio.post('/v1/auth/register', data: json);
      print(data);
      return true;
    } catch (e) {
      print("Erro na solicitação: $e");
      return false;
    }
  }
}
