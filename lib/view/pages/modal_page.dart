import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/pages/home_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/app_bar.dart';

class ModalPage extends StatefulWidget {
  const ModalPage({super.key});

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
          icon: Icon(Icons.my_library_add_outlined),
          label: 'Minhas Musicas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
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

const List<Widget> _pages = <Widget>[
  HomePage(),
  Text(
    'Index 1: Business',
  ),
  Text(
    'Index 2: School',
  ),
  Text(
    'Index 3: Settings',
  ),
  Text(
    'Index 4: Settings',
  ),
];

Widget _home() {
  return _pages.elementAt(_selectedIndex);
}
