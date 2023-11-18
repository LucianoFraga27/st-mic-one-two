import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/card_music.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class ParaVoceWidget extends StatelessWidget {
  ParaVoceWidget(
      {super.key,
      required this.id,
      required this.titulo,
      required this.autor,
      required this.genero,
      required this.capa,
      required this.audio,
      required this.autorId, 
      required this.musicaId});

  String id;
  String titulo;
  String autor;
  String genero;
  String capa;
  String audio;
  String autorId;
  String musicaId;

  ThemeColors themeColors = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 190, 150, 240),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Cor da sombra
                    spreadRadius: 1, // Raio de propagação da sombra
                    blurRadius: 10, // Raio de desfoque da sombra
                    offset: const Offset(
                        0, 1), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          child: Image.network(capa),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(titulo,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255))),
                            Text(autor,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)))
                          ],
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8, right: 10, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          genero,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 208, 208, 208)),
                        )
                        //,Icon(Icons.delete_forever, color: Colors.red),
                        ,
                        IconButton(
                          icon: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicDialog(
                                        audio: audio,
                                        autor: autor,
                                        autorId: autorId,
                                        capa: capa,
                                        musicaId: musicaId,
                                        titulo: titulo,
                                      )
                                  // MusicDialog(),
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
