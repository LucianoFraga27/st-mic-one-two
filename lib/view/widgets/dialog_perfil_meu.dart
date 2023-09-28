import 'dart:math';

import 'package:flutter/material.dart';

final Random random = Random();

int generateRandomNumber() {
  return random.nextInt(10000);
}

dialogPerfilMeu(
  context,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/meuperfil.png'), // Substitua pelo caminho da imagem do usuário
              ),
              SizedBox(height: 16),
              Text(
                'Lucas Silva',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Faixas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${generateRandomNumber()}',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Seguidores',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${generateRandomNumber()}',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Seguindo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${generateRandomNumber()}',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para "Ver Perfil"
                    },
                    child: Text(
                      'Ver Perfil',
                      style: TextStyle(color: Color.fromARGB(197, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
