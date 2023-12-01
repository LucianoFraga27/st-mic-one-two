import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_vm.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtir_repository.dart';
import 'package:mic_check_one_two/domain/repository/tops/top_vm.dart';
import 'package:mic_check_one_two/view/pages/perfiL_do_usuario_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int clicks = 0;
  late CurtiuRepository curtiuRepository;
  late SharedPreferences sp;

  void initializeObjects() async {
    curtiuRepository = CurtiuRepository(); // Inicialize seu CurtiuRepository
    sp = await SharedPreferences.getInstance(); // Inicialize seu SharedPreferences
  }

  @override
  void initState() {
     // TODO: implement initState
    super.initState();
     initializeObjects();
  }
  @override
  Widget build(BuildContext context) {
    
    final musicaVM = ref.watch(topViewModelProvider);
   
    ;

    return musicaVM.when(
      data: (data) {
        final TopViewState(:musicas) = data;
        return _contain(context, musicas);
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }

  Column _contain(BuildContext context, musicasTop) {
     final curtidaVM = ref
        .watch(CurtidaOuNaoViewModelProvider(idMusica: int.tryParse(musicasTop[0]['idMusica'].toString())));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:
              EdgeInsets.only(right: 8.0, left: 10.0, bottom: 8.0, top: 20),
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
                    color: Color.fromARGB(255, 205, 165, 255)),
                child: Stack(
                  children: [
                    Positioned(
                      right: 8.0,
                      bottom: 8.0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicDialog(
                                        audio: musicasTop[0]['audio'],
                                        autor: musicasTop[0]['autor']['username'],
                                        autorId: musicasTop[0]['autor']['id'].toString(),
                                        capa: musicasTop[0]['capa'],
                                        musicaId: musicasTop[0]['idMusica'].toString(),
                                        titulo: musicasTop[0]['titulo'],
                                      )
                                  // MusicDialog(),
                                  ),
                            );
                            },
                            icon: const Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 15),
                          curtidaVM.when(
                    data: (data) {
                      final CurtidaOuNaoViewState(:curtiu) = data;
                      return _curtirBTN(musicasTop[0]['idMusica'].toString(), curtiu);
                    },
                    error: (error, stackTrace) {
                      return Container();
                    },
                    loading: () => _curtirBTN(musicasTop[0]['idMusica'].toString(), false)),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              musicasTop[0]['titulo'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PerfilDoUsuarioPage(
                                      id: musicasTop[0]['autor']['id']
                                          ,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
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
  IconButton _curtirBTN(idMusica, curtiu) {
    if(clicks == 0) {
      setState(() {
      favorito = curtiu;
    });
    }
    return IconButton(
        onPressed: () {
          setState(() {
            clicks += 1;
            curtiuRepository.curtir(idMusica);
            favorito = !favorito;
          });
        },
        icon: Icon(
          Icons.favorite,
          color: favorito ? ThemeColors().favorite : Colors.white,
        ));
  }
}
