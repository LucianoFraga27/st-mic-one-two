import 'package:flutter/material.dart';
import 'package:mic_check_one_two/domain/repository/remover_musica/remover_musica_repository.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/card_music.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class MinhasFaixasWidgetUsuarioDeFora extends StatefulWidget {
  MinhasFaixasWidgetUsuarioDeFora(
      {super.key,
      required this.id,
      required this.titulo,
      required this.autor,
      required this.genero,
      required this.capa,
      required this.audio,
      required this.autorId,
      required this.musicaId,
      required this.curtidas});

  String id;
  String titulo;
  String autor;
  String genero;
  String capa;
  String audio;
  String autorId;
  String musicaId;
  String curtidas;

  @override
  State<MinhasFaixasWidgetUsuarioDeFora> createState() => _MinhasFaixasWidgetUsuarioDeForaState();
}

class _MinhasFaixasWidgetUsuarioDeForaState extends State<MinhasFaixasWidgetUsuarioDeFora> {
  ThemeColors themeColors = ThemeColors();
  late RemoverRepositoryTemp removerRepositoryTemp;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    removerRepositoryTemp = RemoverRepositoryTemp();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
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
                        offset: const Offset(0,
                            1), // Deslocamento da sombra (horizontal, vertical)
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
                              child: Image.network(widget.capa),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.titulo,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255))),
                                Text(widget.autor,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255))),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        size: 14, color: Colors.white),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(widget.curtidas,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ],
                                )
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
                              widget.genero,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 208, 208, 208)),
                            )
                            //,Icon(Icons.delete_forever, color: Colors.red),
                            ,
                            Row(
                              children: [
                                
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
                                                audio: widget.audio,
                                                autor: widget.autor,
                                                autorId: widget.autorId,
                                                capa: widget.capa,
                                                musicaId: widget.musicaId,
                                                titulo: widget.titulo,
                                              )
                                          // MusicDialog(),
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
              if (loading)
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)), // Atraso de 1 segundo
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Colors.red.withOpacity(0.5),
                  height: 110,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink(); // Widget vazio quando o atraso terminar
              }
            },
          ),
        ],
      ),
    );
  }
}
