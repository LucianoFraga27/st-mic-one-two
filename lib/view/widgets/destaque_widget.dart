import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_famoso.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_meu.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';

class DestaqueWidget extends StatefulWidget {
  DestaqueWidget({super.key});

  @override
  State<DestaqueWidget> createState() => _DestaqueWidgetState();
}

class _DestaqueWidgetState extends State<DestaqueWidget> {
  ThemeColors themeColors = ThemeColors();

  Color corFavorite = Colors.white;
  bool favorito = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: Text(
            "Lotando as casas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 53, 53, 53)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Cor da sombra
                      spreadRadius: 1, // Raio de propagação da sombra
                      blurRadius: 10, // Raio de desfoque da sombra
                      offset: const Offset(0,
                          1), // Deslocamento da sombra (horizontal, vertical)
                    ),
                  ],
                  gradient: themeColors.gradient,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 8.0,
                      bottom: 8.0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MusicDialog();
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 15),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (favorito == false) {
                                  corFavorite = themeColors.favorite;
                                  favorito = true;
                                } else {
                                  corFavorite = Colors.white;
                                  favorito = false;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: corFavorite,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  "assets/capa_music.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "De Manhã",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                dialogPerfilFamoso(context);
                              },
                              child: const Text(
                                "2P",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
