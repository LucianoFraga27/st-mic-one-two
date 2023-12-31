import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_famoso.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio_2.dart';

class CardMusica extends StatefulWidget {
  const CardMusica({super.key});

  @override
  State<CardMusica> createState() => _CardMusicaState();
}

ThemeColors themeColors = ThemeColors();

Color corFavorite = Colors.white;
bool favorito = false;

class _CardMusicaState extends State<CardMusica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    offset: const Offset(
                        0, 1), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
                color: Colors.grey.withOpacity(0.6),),
            child: Stack(
              children: [
                Positioned(
                  right: 8.0, // Ajuste a posição horizontal conforme necessário
                  bottom: 8.0, // Ajuste a posição vertical conforme necessário
                  child: AudioPlayerUrl_2(),
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
                                  color: Colors.black
                                      .withOpacity(0.2), // Cor da sombra
                                  spreadRadius:
                                      3, // Raio de propagação da sombra
                                  blurRadius: 2, // Raio de desfoque da sombra
                                  offset: const Offset(0,
                                      3), // Deslocamento da sombra (horizontal, vertical)
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
                          )),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
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
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _BTNS(BuildContext context) {
    return Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: IconButton(
                        onPressed: () {
                          print("Entrou aqui");
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return MusicDialog(); // Chama o MusicDialog() dentro do showDialog
                          //   },
                          // );
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Container(),
));
                        },
                        icon: const Icon(
                          Icons
                              .play_circle_outline_rounded, // Ícone no canto inferior direito
                          color: Colors.white,
                          size: 26,
                        ),
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
                        Icons.favorite, // Ícone no canto inferior direito
                        color: corFavorite,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_rounded,
                        color: const Color.fromARGB(255, 47, 47, 47),
                        size: 24,
                      ),
                    ),
                  ],
                );
  }
}
