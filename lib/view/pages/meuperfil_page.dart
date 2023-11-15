import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/minha_faixa_widget.dart';

class MeuPerfilPage extends StatefulWidget {
  final String nome;
  final String email;
  final String foto;
  final String genero;
  final int seguidores;
  final int seguindo;
  MeuPerfilPage({
    required this.nome,
    required this.email,
    required this.foto,
    required this.genero,
    required this.seguidores,
    required this.seguindo,
    Key? key,
  }) : super(key: key);

  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState(email: email, foto: foto, nome: nome, genero: genero, seguidores: seguidores, seguindo: seguindo);
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  
_MeuPerfilPageState({this.nome, this.email, this.foto, this.genero, this.seguidores, this.seguindo});

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
    return Center(
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
                  child: Text('Popularidade'),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          exibirGrafico ? _exibirGrafico() : _minhasFaixas(),
        ],
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
    // Lógica para exibir o gráfico aqui
    return DataTable(
          columns: [
            DataColumn(label: Text('Título da Música')),
            DataColumn(label: Text('Curtidas')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Nome da Música 1')),
              DataCell(Text('100')),
            ]),
            DataRow(cells: [
              DataCell(Text('Nome da Música 2')),
              DataCell(Text('150')),
            ]),
            DataRow(cells: [
              DataCell(Text('Nome da Música 3')),
              DataCell(Text('80')),
            ]),
            // Adicione mais linhas conforme necessário
          ],
        
    );
  }

  Widget _minhasFaixas() {
    // Lógica para exibir o gráfico aqui
    return MinhaFaixaWidget();
  }
}
