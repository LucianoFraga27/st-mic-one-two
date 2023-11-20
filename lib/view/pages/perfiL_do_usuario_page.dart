import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/vm/listar_curtidas_vm.dart';
import 'package:mic_check_one_two/domain/repository/seguir/riverpod/seguir_vm.dart';
import 'package:mic_check_one_two/domain/repository/seguir/seguir_usuario_repository_temp.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/vm/login_state.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/widgets/minha_faixa_widget.dart';
import 'package:mic_check_one_two/view/widgets/paravoce_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilDoUsuarioPage extends ConsumerStatefulWidget {
  int id;

  PerfilDoUsuarioPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PerfilDoUsuarioPage> createState() =>
      _MeuPerfilPageState(id: id);
}

class _MeuPerfilPageState extends ConsumerState<PerfilDoUsuarioPage> {
  _MeuPerfilPageState({required this.id});
  int id;
  late SeguirUsuarioRepositoryTemp seguirUsuarioRepositoryTemp;
  bool seguindo_usuario = false;
  int seguidoresDoUsuario = 0;
  bool exibirGrafico = false;
  int click = 0;
  String meu_id = "1";
  late SharedPreferences sp;

  init() async {
    sp = await SharedPreferences.getInstance();
    meu_id = sp.getString(LocalStorageKeys.idUsuario).toString();
    seguirUsuarioRepositoryTemp = SeguirUsuarioRepositoryTemp();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioVM = ref.watch(UsuarioVmProvider(id: id.toString()));
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: usuarioVM.when(
        data: (data) {
          final UsuarioState(:usuario) = data;
          return _body(
              usuario['username'],
              usuario['email'],
              usuario['fotoPerfil'],
              usuario['seguidoresCount'],
              usuario['seguindoCount'],
              usuario['id']);
        },
        error: (error, stackTrace) => Container(),
        loading: () => CircularProgressIndicator(),
      )),
    );
  }

  Center _body(String nome, String email, String capa, int seguidores,
      int seguindo, int id) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(capa),
          ),
          SizedBox(height: 20),
          Text(
            '$nome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$email',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          _infos(seguidores, seguindo, id.toString()),
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
                  child: Text('Faixas'),
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
    );
  }

  Row _infos(seguidores, seguindo, id) {
    log("ID DO USUARIO $id");
    final seguirVM =
        ref.watch(SeguirOuNaoViewModelProvider(idMusica: int.tryParse(id)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (meu_id != id.toString())
          seguirVM.when(
            data: (data) {
              final SeguirOuNaoViewState(:segue) = data;
              log("Segue ::::::::::::::::::::::: $segue");
              return btnseguir(id, segue, seguidores);
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          ),
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
              seguidoresDoUsuario.toString(),
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
              '$seguindo'.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  ElevatedButton btnseguir(id, segue, seguidores) {
    setState(() {
      if (click == 0) {
        seguindo_usuario = segue;
        seguidoresDoUsuario = seguidores;
      }
    });
    return ElevatedButton(
      onPressed: () {
        setState(() {
          click++;
          seguindo_usuario = !seguindo_usuario;
          seguirUsuarioRepositoryTemp.seguir(id.toString());
          if (seguindo_usuario == true) {
            seguidoresDoUsuario += 1;
          } else {
            seguidoresDoUsuario -= 1;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        // Cor de fundo transparente
        onPrimary: Color.fromARGB(197, 0, 0, 0), // Cor do texto
      ),
      child: Text(seguindo_usuario ? 'Seguindo' : 'Seguir'),
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
    return MinhaFaixaWidget(
      id: id.toString(),
    );
  }
}
