import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/vm/login_state.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/pages/home_page.dart';
import 'package:mic_check_one_two/view/pages/meuperfil_page.dart';
import 'package:mic_check_one_two/view/pages/musicas_page.dart';
import 'package:mic_check_one_two/view/pages/pesquisa_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

   late SharedPreferences prefs;
  var id;
  @override
  void initState() {
    super.initState();
    _carregarSharedPreferences();
   }

  Future<void> _carregarSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
    id = prefs.getString(LocalStorageKeys.idUsuario);
    print("id do usuario: $id");
  });
  }

   Future<void> guardarGeneroFavorito(String genero) async {
    print("genero favorito" + genero);
    prefs.setString(LocalStorageKeys.generoFavorito, genero);
  }

  @override
  Widget build(BuildContext context) {
    final usuarioVM = ref.watch(UsuarioVmProvider(id: id));

    return Scaffold(
      appBar: customAppBar(context),
      body: usuarioVM.when(
          data: (data) {
            final UsuarioState(:usuario) = data;
            guardarGeneroFavorito(usuario['generoFavorito'] ?? "");
            List<Widget> pages = <Widget>[
              const HomePage(),
              MusicasPage(),
              PesquisaMusicaPage(),
              MeuPerfilPage(id:usuario["id"].toString(),nome:usuario['username'], email: usuario['email'], foto: usuario['fotoPerfil'], genero: usuario['generoFavorito'] ?? "", seguidores:  usuario['seguidoresCount'], seguindo: usuario['seguindoCount'])
            ];
            Widget _home() {
              return pages.elementAt(_selectedIndex);
            }

            return _home();
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Container()),
      bottomNavigationBar: _customButtonNavigationBar(),
     );
  }

  _customButtonNavigationBar() {
    return  BottomNavigationBar(
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
          onTap: onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 221, 27, 255),
          unselectedItemColor: Colors.grey,
          
        );
  }
}
