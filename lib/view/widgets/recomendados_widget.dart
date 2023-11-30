import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_vm.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';

class RecomendadosWidget extends ConsumerStatefulWidget {
  RecomendadosWidget({super.key});

  @override
  ConsumerState<RecomendadosWidget> createState() => _RecomendadosWidgetState();
}

class _RecomendadosWidgetState extends ConsumerState<RecomendadosWidget> {
  ThemeColors themeColors = ThemeColors();

  @override
  Widget build(BuildContext context) {

    final musicaVM = ref.watch(MusicaViewModelProvider());
    
    return musicaVM.when(data: (data) {
      final MusicaViewState(:musicasTop) = data;
      return _contain(context, musicasTop);
    }, error: (error, stackTrace) {
      
      return Container();
    }, loading: () {
      return Container(
        height: 200,
        child: Center(child: CircularProgressIndicator(color:Color.fromARGB(255, 182, 123, 255)))
      );
    },);

   
  }

  Container _contain(BuildContext context,musicasTop) {
    List<dynamic> musicas = musicasTop;
    return Container(
    width: MediaQuery.of(context).size.width,
    // color: const Color.fromARGB(255, 255, 241, 240),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0, left: 15.0),
          child: Text(
            "Em alta",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 53, 53, 53)),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
          color: Colors.transparent,// Defina a altura desejada para a lista horizontal
          child: ListView.separated(
            scrollDirection: Axis.horizontal, // Define o eixo horizontal
            itemBuilder: (BuildContext context, int index) {
              return _recomendadoWidget(context, index, musicas);
            },
            itemCount: musicas.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 0); // Espaçamento entre os itens
            },
          ),
        ),
      ],
    ),
  );
  }

  Widget _recomendadoWidget(BuildContext context, int index, musicas) {
    print( "autor: "+ musicas[index]['autor']['username']);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0, left: 3.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("TOP #${index + 1}"),
                          InkWell(
                            onTap: () {
                              String autor = musicas[index]['autor']['username'].toString();
                              String titulo = musicas[index]['titulo'].toString();
                              String id = musicas[index]['idMusica'].toString();
                              log("CLicou na musica $id : $titulo : $autor");
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicDialog(
                                        audio: musicas[index]['audio'],
                                        autor: musicas[index]['autor']['username'],
                                        autorId: musicas[index]['autor']['id'].toString(),
                                        capa: musicas[index]['capa'],
                                        musicaId: musicas[index]['idMusica'].toString(),
                                        titulo: musicas[index]['titulo'],
                                      )
                                  // MusicDialog(),
                                  ),
                            );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, right: 2.0, left: 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color:Color.fromARGB(255, 205, 165, 255), // Cor da sombra
                                          spreadRadius:
                                              1, // Raio de propagação da sombra
                                          blurRadius:
                                              4, // Raio de desfoque da sombra
                                          offset: const Offset(3,
                                              3), // Deslocamento da sombra (horizontal, vertical)
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                       musicas[index]['capa'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: musicas[index]['autor']['username'] + " - ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black, // Cor do "2P"
                                  ),
                                ),
                                TextSpan(
                                  text: musicas[index]['titulo'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black, // Cor do texto
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
