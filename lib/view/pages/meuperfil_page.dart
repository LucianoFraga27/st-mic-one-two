import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/vm/listar_curtidas_vm.dart';
import 'package:mic_check_one_two/domain/repository/representacaoUsuario/representacaousuario_vm.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/vm/login_state.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/pages/lista_seguidores_page.dart';
import 'package:mic_check_one_two/view/widgets/minha_faixa_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/paravoce_widget.dart';

class MeuPerfilPage extends ConsumerStatefulWidget {
  
  MeuPerfilPage({
    Key? key,
  }) : super(key: key);

  @override
 ConsumerState<MeuPerfilPage>  createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends ConsumerState<MeuPerfilPage> {
  

    late SharedPreferences prefs;
  var id;
  int seguidores = 0;
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
    seguidores = prefs.getInt(LocalStorageKeys.countSeguidores) ?? 0;
  });
  }
  
  bool exibirGrafico = false;
  
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _carregarSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Duration(seconds: 2);
    final usuarioVM = ref.watch(RepresentacaousuarioVmProvider());
    return SingleChildScrollView(
      child: Center(
        child:Builder(builder: (context)  {
         

          return usuarioVM.when(data: (data) { 
          
          final RepresentacaousuarioViewState(:usuario) = data;
          log("000000000000000000000000000");
          log(usuario.toString());
           log("000000000000000000000000000");
          return column(usuario['username'], usuario['fotoPerfil'], usuario['email'], usuario['seguidoresCount'], usuario['seguindoCount'] ); }, error: (e,s) => Container(), loading: () => Container());
      
        },)),
    );
  }

  Column column(nome, foto, email, seguidores, seguindo) {
    return Column(
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
          _infos(seguidores, seguindo,nome),
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
                     backgroundColor: exibirGrafico ?  Colors.white54 : Color.fromARGB(255, 209, 171, 255),
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
                     backgroundColor: exibirGrafico ? Color.fromARGB(255, 209, 171, 255) : Colors.white54,
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
      );
  }

    _infos(seguidores, seguindo,nome) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: 
        (context) => ListaSeguidoresPage(id: id, usuario: nome),));
      },
      child: Row(
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
      ),
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
                                musicaId: musicas[i]['id'].toString()),
                                
                                
                                SizedBox(height: 20,),
                                
                       
                        
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
    return Column(
      children: [
        MinhaFaixaWidget(id: id,),
        SizedBox(height: 20,),
      ],
    );
  }
}
