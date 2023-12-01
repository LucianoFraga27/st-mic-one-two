import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/pesquisar/pesquisar_vm.dart';
import 'package:mic_check_one_two/view/widgets/paravoce_widget.dart';

class PesquisaMusicaPage extends ConsumerStatefulWidget {
  @override
  _PesquisaMusicaPageState createState() => _PesquisaMusicaPageState();
}

class _PesquisaMusicaPageState extends ConsumerState<PesquisaMusicaPage> {
  TextEditingController _searchController = TextEditingController();
  bool pesquisar = false;
  @override
  Widget build(BuildContext context) {
     final musicaVM = ref.watch(PesquisarViewModelProvider(pesquisa: _searchController.text));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            _buildSearchField(),
            SizedBox(height: 16),
          if(pesquisar == true ) musicaVM.when(data: (data) {
                   final PesquisarViewState(:musicas) = data;
                   return _paravoce(musicas);
                   }, error: (error, stackTrace) => Text("Ocorreu um erro"),
                    loading: () => Container(height: 500, child: Center(child: CircularProgressIndicator(color:Color.fromARGB(255, 182, 123, 255)) )))
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: 'Pesquisar Músicas',
        hintText: 'Digite o nome da música ou artista',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.black), // Cor preta quando focado
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
     onSubmitted: (value) {
       setState(() {
         pesquisar = true;
       });
     },
    );
  }

 
  _paravoce(musicasDoGenero) {
    List<dynamic> musicas = musicasDoGenero;
    return Column(
      children: [
        const SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: musicas.length, // O número de cartões de música que você deseja criar
          itemBuilder: (context, index) {
            return ParaVoceWidget(
              autor: musicas[index]["autor"]["username"],
              genero:  musicas[index]["genero"],
              id:  musicas[index]["id"].toString(),
              titulo:  musicas[index]["titulo"],
              capa: musicas[index]["capa"],
              audio: musicas[index]["audio"],
              autorId: musicas[index]["autor"]["id"].toString(),
              musicaId: musicas[index]["id"].toString(),
            );
          },
        ),
      ],
    );
  }
}
