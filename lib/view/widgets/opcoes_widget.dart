import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_meu.dart';

class OpcoesWidget extends StatelessWidget {
  OpcoesWidget({super.key});

  final Random random = Random();

  int generateRandomNumber() {
    return random.nextInt(10000);
  }

  ThemeColors themeColors = ThemeColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 1),
            _esquerda(context),
            const SizedBox(width: 10),
            _direita(context),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }

  Container _esquerda(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/curtidas');
              },
              splashColor: Colors.black.withOpacity(0.2),
              child: _cardEsquerda(context, Icons.favorite, "Curtidas"),
            ),
          ),
        ],
      ),
    );
  }

  Container _cardEsquerda(BuildContext context, IconData icon, String value) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color:Color.fromARGB(255, 182, 123, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 53, 53, 53),
            ),
          ),
        ],
      ),
    );
  }

  Container _direita(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/upload-musica');
              },
              splashColor: Colors.black.withOpacity(0.2),
              child: _cardEsquerda(
                context,
                Icons.cloud_upload_outlined,
                "Upload",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
