import 'package:flutter/material.dart';

sealed class LocalStorageKeys {
  static const accessToken = 'ACCESS_TOKEN_KEY';
}

sealed class Environment {
  static const String backendLOCAL = "http://127.0.0.1:8082/";
  static const String backendPROD = "";
}

class OneTwoNavGlobalKey {
  static OneTwoNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  OneTwoNavGlobalKey._();

  static OneTwoNavGlobalKey get instance =>
      _instance ??= OneTwoNavGlobalKey._();
}
