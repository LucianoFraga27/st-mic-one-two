import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_vm.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/widgets/card_music.dart';
import 'package:mic_check_one_two/view/widgets/destaque_widget.dart';
import 'package:mic_check_one_two/view/widgets/minha_faixa_widget.dart';
import 'package:mic_check_one_two/view/widgets/paravoce_widget.dart';
import 'package:mic_check_one_two/view/widgets/seguindo_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicasPage extends ConsumerStatefulWidget {
  @override
  _MusicasPageState createState() => _MusicasPageState();
}

class _MusicasPageState extends ConsumerState<MusicasPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late SharedPreferences prefs;
  var genero;
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _carregarSharedPreferences();
  }
  Future<void> _carregarSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
    genero = prefs.getString(LocalStorageKeys.generoFavorito);
    print("genero do usuario: $genero");
  });
  }

  @override
  Widget build(BuildContext context) {
    final musicaVM = ref.watch(MusicaViewModelProvider());
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     _pageController.animateToPage(0,
              //         duration: Duration(milliseconds: 300),
              //         curve: Curves.ease);
              //   },
              //   child: Text(
              //     'Seguindo',
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: _currentPage == 0 ? Colors.black : Colors.grey,
              //     ),
              //   ),
              // ),
              // SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Text(
                  'Para Você',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentPage == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
             // SingleChildScrollView(child: _seguindo()),
              SingleChildScrollView(child: musicaVM.when(data: (data) {
                 final MusicaViewState(:musicasDoGenero) = data;
                 return _paravoce(musicasDoGenero);
                 }, error: (error, stackTrace) => Text("Ocorreu um erro"), loading: () => Container(height: 500, child: Center(child: CircularProgressIndicator(color:Color.fromARGB(255, 182, 123, 255)) )))),
            ],
          ),
        ),
      ],
    );
  }

  _paravoce(musicasDoGenero) {
    List<dynamic> musicas = musicasDoGenero;
    return Column(
      children: [
        const SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: musicas.length, // O número de cartões de música que você deseja criar
          itemBuilder: (context, index) {
            return ParaVoceWidget(
              autor: musicas[index]["autor"]["username"],
              genero:  musicas[index]["genero"],
              id:  musicas[index]["id"].toString(),
              titulo:  musicas[index]["titulo"],
              capa: musicas[index]["capa"],
              audio: musicas[index]["audio"],
              autorId: musicas[index]["autor"]["id"].toString(),
              musicaId: musicas[index]["id"].toString(),
            );
          },
        ),
      ],
    );
  }

  Column _seguindo() {
    return Column(
      children: [
        const SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return SeguindoWidget();
          },
        ),
      ],
    );
  }
}
