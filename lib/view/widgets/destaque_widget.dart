import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_vm.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_famoso.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_meu.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';

class DestaqueWidget extends ConsumerStatefulWidget {
  DestaqueWidget({super.key});

  @override
  ConsumerState<DestaqueWidget> createState() => _DestaqueWidgetState();
}

@JsonSerializable()
class _DestaqueWidgetState extends ConsumerState<DestaqueWidget> {
  ThemeColors themeColors = ThemeColors();

  Color corFavorite = Colors.white;
  bool favorito = false;

  @override
  Widget build(BuildContext context) {
    final musicaVM = ref.watch(MusicaViewModelProvider());
    
    return musicaVM.when(data: (data) {
      final MusicaViewState(:musicasTop) = data;
      return _contain(context, musicasTop);
    }, error: (error, stackTrace) {
      return Container();
    }, loading: () {
      return Container();
    },);
   
  }

  Column _contain(BuildContext context, musicasTop) {
    
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(right: 8.0, left: 10.0, bottom: 8.0, top: 20),
        child: Text(
          "TOP #1 - Lotando as casas",
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
                // gradient: themeColors.gradient,
                color:Color.fromARGB(255, 205, 165, 255)

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
                                // return MusicDialog();
                                return Container();
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
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                musicasTop[0]['capa'],
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
                          SizedBox(height: 10,),
                           Text(
                            musicasTop[0]['titulo'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              dialogPerfilFamoso(context);
                            },
                            child:  Text(
                             musicasTop[0]['autor']['username'],
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
