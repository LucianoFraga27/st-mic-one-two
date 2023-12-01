import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/vm/listar_curtidas_vm.dart';
import 'package:mic_check_one_two/domain/repository/listarSeguidores/listarseguidores_vm.dart';
import 'package:mic_check_one_two/domain/repository/listarSeguindo/listarseguindo_vm.dart';
import 'package:mic_check_one_two/view/widgets/card_usuario_widget.dart';

class ListaSeguidoresPage extends ConsumerWidget {
  ListaSeguidoresPage({super.key, required this.id, required this.usuario});
  String id;
  String usuario;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listarSeguidoresVM =
        ref.watch(ListarseguidoresVmProvider(idUsuario: id));
    final listarSeguindoVM = ref.watch(ListarseguindoVmProvider(idUsuario: id));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil $usuario'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Seguindo',
              ),
              Tab(
                text: 'Seguidores',
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: const Color.fromARGB(255, 205, 83, 227),
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            listarSeguindoVM.when(
              data: (data) {
                final ListarseguindoViewState(:seguindo) = data;
                List s = seguindo;
                return ListView.separated(
                    itemBuilder: (context, index) => CardUsuarioWidget(
                          capa: s[index]['fotoPerfil'],
                          email: s[index]['email'],
                          id: s[index]['id'].toString(),
                          nome: s[index]['username'],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: s.length);
              },
              error: (error, stackTrace) {
                return Container();
              },
              loading: () => Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Center(child: CircularProgressIndicator())),
            ),

            listarSeguidoresVM.when(
              data: (data) {
                final ListarseguidoresViewState(:seguidores) = data;
                List s = seguidores;
                return ListView.separated(
                    itemBuilder: (context, index) => CardUsuarioWidget(
                          capa: s[index]['fotoPerfil'],
                          email: s[index]['email'],
                          id: s[index]['id'].toString(),
                          nome: s[index]['username'],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: s.length);
              },
              error: (error, stackTrace) {
                return Container();
              },
              loading: () => CircularProgressIndicator(),
            ),

            // Conteúdo da aba "Seguidores"
          ],
        ),
      ),
    );
  }

  _seguindo(String id, ref) {
    return Container();
  }
}
