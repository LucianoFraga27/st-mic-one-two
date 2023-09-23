import 'package:flutter/material.dart';

class ThemeColors {
  Color azul = Colors.blue;
  var gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey[100]!,
      Colors.grey[300]!,
      Colors.grey[500]!
    ], // Cores do gradiente
  );
}
