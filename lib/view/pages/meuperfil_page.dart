import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/vm/listar_curtidas_vm.dart';
import 'package:mic_check_one_two/view/widgets/minha_faixa_widget.dart';

import '../widgets/paravoce_widget.dart';

class MeuPerfilPage extends ConsumerStatefulWidget {
  final String nome;
  final String email;
  final String foto;
  final String genero;
  final int seguidores;
  final int seguindo;
  final String id;
  MeuPerfilPage({
    required this.nome,
    required this.email,
    required this.foto,
    required this.genero,
    required this.seguidores,
    required this.seguindo,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
 ConsumerState<MeuPerfilPage>  createState() => _MeuPerfilPageState(id: id,email: email, foto: foto, nome: nome, genero: genero, seguidores: seguidores, seguindo: seguindo);
}

class _MeuPerfilPageState extends ConsumerState<MeuPerfilPage> {
  
_MeuPerfilPageState({ required this.id, this.nome, this.email, this.foto, this.genero, this.seguidores, this.seguindo});

  String id;
  String? nome;
  String? email;
  String? foto;
  String? genero;
  int? seguidores;
  int? seguindo;
  
  bool exibirGrafico = false;
  
  @override
  Widget build(BuildContext context) {
    print(nome.toString());
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  foto.toString()),
            ),
            SizedBox(height: 20),
            Text(
              nome.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            
            SizedBox(height: 20),
            _infos(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        exibirGrafico = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // Cor de fundo transparente
                      onPrimary: Color.fromARGB(197, 0, 0, 0), // Cor do texto
                    ),
                    child: Text('Minhas Faixas'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        exibirGrafico = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // Cor de fundo transparente
                      onPrimary: Color.fromARGB(197, 0, 0, 0), // Cor do texto
                    ),
                    child: Text('Curtidas'),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            exibirGrafico ? _exibirGrafico() : _minhasFaixas(id),
          ],
        ),
      ),
    );
  }

  Row _infos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Column(
        //   children: [
        //     Text(
        //       'Faixas',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     Text(
        //       '13',
        //       style: TextStyle(
        //         fontSize: 18,
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              'Seguidores',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              seguidores.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              'Seguindo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              seguindo.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _exibirGrafico() {
    final curtidaVM = ref.watch(ListarCurtidasViewModelProvider(
        idUsuario: int.tryParse(id.toString())));
    return curtidaVM.when(
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
                    loading: () => CircularProgressIndicator(
                        color: Color.fromARGB(255, 182, 123, 255)));
  }

  Widget _minhasFaixas(id) {
    // Lógica para exibir o gráfico aqui
    return MinhaFaixaWidget(id: id,);
  }
}
