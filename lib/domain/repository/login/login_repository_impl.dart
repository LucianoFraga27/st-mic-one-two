import 'dart:io';

import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'login_repository.dart';
import 'dart:developer';

class LoginRepositoryImpl implements LoginRepository {
  final RestClient restClient;
  LoginRepositoryImpl({
    required this.restClient,
  });

  @override
  Future login(String email, String password) async {
    try {
      final Response(:data) = await restClient.unAuth.post('/v1/auth/login',
          data: {'username': email, 'password': password});
      return data['access_token'];
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden ||
            statusCode == HttpStatus.unauthorized) {
          log('Login ou senha invalidos', error: e, stackTrace: s);
          return Future.error('Login ou senha invalidos');
        }
      }
    }
  }

  @override
  Future register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
