import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

class OpcoesWidget extends StatelessWidget {
  OpcoesWidget({super.key});
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
          child: _cardEsquerda(context, Icons.favorite, "Curtidas"),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child:
              _cardEsquerda(context, Icons.view_compact_sharp, "Reproduções"),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: _cardEsquerda(context, Icons.filter_list_alt, "Playlists"),
        ),
      ],
    ));
  }

  Container _cardEsquerda(BuildContext context, IconData icon, String value) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: themeColors.gradient3,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Cor da sombra
                spreadRadius: 1, // Raio de propagação da sombra
                blurRadius: 2, // Raio de desfoque da sombra
                offset: const Offset(
                    0, 1), // Deslocamento da sombra (horizontal, vertical)
              ),
            ]),
        child: Row(
          children: [
            Container(
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              value,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 53, 53, 53)),
            )
          ],
        ));
  }

  Container _direita(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: _cardDireita(context, Icons.cloud_upload_outlined, "Upload"),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: _cardDireita(context, Icons.person, "Meu Perfil"),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: _cardDireita(context, Icons.settings, "Configuração"),
        ),
      ],
    ));
  }

  Container _cardDireita(BuildContext context, IconData icon, String value) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: themeColors.gradient3,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Cor da sombra
                spreadRadius: 1, // Raio de propagação da sombra
                blurRadius: 2, // Raio de desfoque da sombra
                offset: const Offset(
                    0, 1), // Deslocamento da sombra (horizontal, vertical)
              ),
            ]),
        child: Row(
          children: [
            Container(
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              value,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 53, 53, 53)),
            )
          ],
        ));
  }
}
