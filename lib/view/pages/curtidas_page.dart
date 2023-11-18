import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_vm.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/widgets/curtidas_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/app_bar.dart';

class CurtidasPage extends ConsumerStatefulWidget {
  const CurtidasPage({super.key});

  @override
   ConsumerState<CurtidasPage> createState() => _CurtidasPageState();
}

class _CurtidasPageState extends  ConsumerState<CurtidasPage> {

 String? id;

  @override
  void initState() {
    _getIdFromSharedPreferences();
    super.initState();
    
  }

  Future<void> _getIdFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedId = prefs.getString(LocalStorageKeys.idUsuario); // Supondo que 'id' seja a chave usada para salvar o ID

    setState(() {
      id = savedId ?? '1';
    });
  }


  @override
  Widget build(BuildContext context) {
    final musicaVM = ref.watch(MusicaViewModelProvider(idUsuario: int.tryParse(id.toString())));
    print("id do usuario: $id");
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              musicaVM.when(data: (data)  {
                // final MusicaViewState(:musicas) = data;
                return Text("musicas");
              } , error: (error, stackTrace) {
                return Center(child: Text("Ocorreu um erro"));
              }, loading: () => Container(height: MediaQuery.of(context).size.height / 2,child: Center(child: CircularProgressIndicator())))
            ],
          )),
    ),
    );
  }

}
