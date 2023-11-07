import 'package:flutter/material.dart';

sealed class LocalStorageKeys {
  static const accessToken = 'ACCESS_TOKEN_KEY';
  static const idUsuario = 'ID_USUARIO';
  static const usernameUsuario = 'USERNAME_USUARIO';
  
}

sealed class Environment {
  static const String backendLOCAL = "http://10.0.2.2:8082/";
  static const String backendLAN = "http://172.25.112.1:8082/";
}

class OneTwoNavGlobalKey {
  static OneTwoNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  OneTwoNavGlobalKey._();

  static OneTwoNavGlobalKey get instance =>
      _instance ??= OneTwoNavGlobalKey._();
}
