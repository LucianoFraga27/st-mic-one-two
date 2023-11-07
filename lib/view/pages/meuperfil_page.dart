import 'package:flutter/material.dart';

class MeuPerfilPage extends StatefulWidget {
  final String nome;
  final String email;
  final String foto;

  MeuPerfilPage({
    required this.nome,
    required this.email,
    required this.foto,
    Key? key,
  }) : super(key: key);

  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState(email: email, foto: foto, nome: nome);
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  
_MeuPerfilPageState({this.nome, this.email, this.foto});

  String? nome;
  String? email;
  String? foto;
  
  
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
                  child: Text('Estatísticas'),
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
        Column(
          children: [
            Text(
              'Faixas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '13',
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
              'Seguidores',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '567',
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
              '567',
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
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue, // Substitua pelo gráfico real
    );
  }

  Widget _minhasFaixas() {
    // Lógica para exibir o gráfico aqui
    return Container(
      width: 200,
      height: 200,
      color: Colors.red, // Substitua pelo gráfico real
    );
  }
}
