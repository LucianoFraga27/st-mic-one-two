import 'package:flutter/material.dart';

class SobreOAPPWiget extends StatelessWidget {
  const SobreOAPPWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 4.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 205, 165, 255), // Cor da sombra
                    spreadRadius: 1, // Raio de propagação da sombra
                    blurRadius: 4, // Raio de desfoque da sombra
                    offset: const Offset(
                        3, 3), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
                borderRadius: BorderRadius.circular(
                    20.0), // Ajuste o valor conforme necessário
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/noticia-onetwo.png",
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }
}
