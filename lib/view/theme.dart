import 'package:flutter/material.dart';

class ThemeColors {
  var login = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color.fromARGB(255, 237, 136, 255),
      const Color.fromARGB(255, 255, 131, 172),
      const Color.fromARGB(255, 233, 127, 127)
    ], // Cores do gradiente
  );

  var loginbtn = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 148, 0, 174),
      Color.fromARGB(255, 195, 43, 94),
      Colors.purple
    ], // Cores do gradiente
  );

  var gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey[100]!,
      Colors.grey[300]!,
      Colors.grey[500]!
    ], // Cores do gradiente
  );

   var branco = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Colors.grey[300]!,
      const Color.fromARGB(255, 242, 172, 255)
    ], // Cores do gradiente
  );

  var brancoBar = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      
      Color.fromARGB(255, 248, 211, 255),
      Colors.grey[100]!,
      Colors.white,
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

  var gradient4 = LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[300]!, // Tom mais claro
                  Colors.grey[500]!, // Tom médio
                  Colors.grey[700]!, // Tom mais escuro
                ]);

  var favorite = const Color.fromARGB(255, 156, 10, 0);
}
