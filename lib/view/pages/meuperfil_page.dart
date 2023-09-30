import 'package:flutter/material.dart';

class MeuPerfilPage extends StatefulWidget {
  const MeuPerfilPage({Key? key}) : super(key: key);

  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState extends State<MeuPerfilPage> {
  bool exibirGrafico = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
                'assets/meuperfil.png'), // Substitua pelo caminho da imagem do usuário
          ),
          SizedBox(height: 20),
          Text(
            'Lucas Silva',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'lucas@email.com',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            'Luciano Lucas Silva',
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
