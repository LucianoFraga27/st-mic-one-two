import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/vm/listar_curtidas_vm.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_vm.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/curtidas_widget.dart';
import 'package:mic_check_one_two/view/widgets/paravoce_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/app_bar.dart';

class CurtidasPage extends ConsumerStatefulWidget {
  const CurtidasPage({super.key});

  @override
  ConsumerState<CurtidasPage> createState() => _CurtidasPageState();
}

class _CurtidasPageState extends ConsumerState<CurtidasPage> {
  String? id;

  @override
  void initState() {
    _getIdFromSharedPreferences();
    super.initState();
  }

  Future<void> _getIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedId = prefs.getString(LocalStorageKeys
        .idUsuario); // Supondo que 'id' seja a chave usada para salvar o ID

    setState(() {
      id = savedId ?? '1';
    });
  }

  @override
  Widget build(BuildContext context) {
    final curtidaVM = ref.watch(ListarCurtidasViewModelProvider(
        idUsuario: int.tryParse(id.toString())));
    print("id do usuario: $id");
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Curtidas"),
      ),
      body: SingleChildScrollView(
        child: Container(
            // height: MediaQuery.of(context).size.height * 1.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // gradient: ThemeColors().branco
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                curtidaVM.when(
                    data: (data) {
                      final ListarCurtidasViewState(:musicas) = data;
                      print(musicas);
                      return Column(
                        children: [
                          
                          for (int i = 0; i < musicas.length; i++)
                            ParaVoceWidget(
                                id: musicas[i][id].toString(),
                                titulo: musicas[i]['titulo'],
                                autor: musicas[i]['autor']['username'].toString(),
                                genero: musicas[i]['genero'],
                                capa: musicas[i]['capa'],
                                audio: musicas[i]['audio'],
                                autorId: musicas[i]['autor']['id'].toString(),
                                musicaId: musicas[i]['id'].toString())
                          
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(child: Text("Ocorreu um erro"));
                    },
                    loading: () => Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 182, 123, 255)))))
              ],
            )),
      ),
    );
  }
}
