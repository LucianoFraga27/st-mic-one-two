import 'package:flutter/material.dart';

class SairDoAppWidget extends StatefulWidget {
  @override
  _SairDoAppWidgetState createState() => _SairDoAppWidgetState();
}

class _SairDoAppWidgetState extends State<SairDoAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent, // Tornar o fundo transparente
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white, // Cor do fundo do diálogo
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Deseja realmente sair?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey, // Cor da linha separadora
              height: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o diálogo
                  },
                  child: Text(
                    'Não',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Fecha o diálogo
                    Navigator.of(context).pushNamedAndRemoveUntil('/',
                        (route) => false); // Redireciona para a tela de login
                  },
                  child: Text(
                    'Sim',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
