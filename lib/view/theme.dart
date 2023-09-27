import 'package:flutter/material.dart';

class ThemeColors {
  var gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey[100]!,
      Colors.grey[300]!,
      Colors.grey[500]!
    ], // Cores do gradiente
  );

  var gradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey[900]!,
      Colors.black!,
      Colors.grey[500]!
    ], // Cores do gradiente
  );

  var gradient3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey[700]!,
      Colors.grey[500]!,
      Colors.grey[400]!
    ], // Cores do gradiente
  );
}
