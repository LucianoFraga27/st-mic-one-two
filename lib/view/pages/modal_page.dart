import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/vm/login_state.dart';
import 'package:mic_check_one_two/view/pages/home_page.dart';
import 'package:mic_check_one_two/view/pages/meuperfil_page.dart';
import 'package:mic_check_one_two/view/pages/musicas_page.dart';
import 'package:mic_check_one_two/view/pages/pesquisa_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/app_bar.dart';

class ModalPage extends ConsumerStatefulWidget {
  ModalPage({super.key});

  @override
  ConsumerState<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends ConsumerState<ModalPage> {
  ThemeColors themeColors = ThemeColors();

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final usuarioVM = ref.watch(UsuarioVmProvider());

    return Scaffold(
      appBar: customAppBar(context),
      body: usuarioVM.when(
          data: (data) {
            final UsuarioState(:usuario) = data;
            List<Widget> pages = <Widget>[
              const HomePage(),
              MusicasPage(),
              PesquisaMusicaPage(),
              MeuPerfilPage(nome:usuario['username'], email: usuario['email'], foto: usuario['fotoPerfil'])
            ];
            Widget _home() {
              return pages.elementAt(_selectedIndex);
            }

            return _home();
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Container()),
      bottomNavigationBar: _customButtonNavigationBar(),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(15),
      //       gradient: themeColors.gradient2),
      //   child:
      //    FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: Colors.transparent,
      //       child: const Icon(
      //         Icons.add,
      //         color: Colors.white,
      //       )),
      // ),
    );
  }

  _customButtonNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_sharp),
          label: 'Musicas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Meu Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      onTap: onItemTapped,
    );
  }
}
