import 'package:flutter/material.dart';

class PesquisaMusicaPage extends StatefulWidget {
  @override
  _PesquisaMusicaPageState createState() => _PesquisaMusicaPageState();
}

class _PesquisaMusicaPageState extends State<PesquisaMusicaPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchField(),
          SizedBox(height: 16),
          _buildSearchResults(),
        ],
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
      onChanged: (query) {},
    );
  }

  Widget _buildSearchResults() {
    // return ListView.builder(
    //   itemCount: searchResults.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(searchResults[index].title),
    //       subtitle: Text(searchResults[index].artist),
    //       onTap: () {
    //         // Adicione ação para abrir detalhes da música quando clicada.
    //       },
    //     );
    //   },
    // );

    return Container();
  }
}
