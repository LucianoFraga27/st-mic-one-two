import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/pages/home_page.dart';
import 'package:mic_check_one_two/view/pages/meuperfil_page.dart';
import 'package:mic_check_one_two/view/pages/musicas_page.dart';
import 'package:mic_check_one_two/view/pages/pesquisa_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/app_bar.dart';

class ModalPage extends StatefulWidget {
  ModalPage({super.key});

  @override
  State<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  ThemeColors themeColors = ThemeColors();

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: _home(),
      bottomNavigationBar: _customButtonNavigationBar(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: themeColors.gradient2),
        child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
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

int _selectedIndex = 0;

List<Widget> _pages = <Widget>[
  const HomePage(),
  MusicasPage(),
  PesquisaMusicaPage(),
  const MeuPerfilPage(),
];

Widget _home() {
  return _pages.elementAt(_selectedIndex);
}
