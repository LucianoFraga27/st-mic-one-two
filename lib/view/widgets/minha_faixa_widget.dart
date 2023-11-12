import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

class MinhaFaixaWidget extends StatelessWidget {
  MinhaFaixaWidget({super.key});

  ThemeColors themeColors = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:5, right:10, left:10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 205, 165, 255),
                boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Cor da sombra
                      spreadRadius: 1, // Raio de propagação da sombra
                      blurRadius: 10, // Raio de desfoque da sombra
                      offset: const Offset(0,
                          1), // Deslocamento da sombra (horizontal, vertical)
                    ),
                  ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child:Row(
                      children: [
                        Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(child: Image.network('https://onetwo-arquivos-estudo.s3.us-east-2.amazonaws.com/catalogo/f2e58320-d552-40ba-8d70-85aedc4d3408_10.png'),
                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("De Manhã", style: TextStyle(fontSize: 16))
                      ,Text("12 curtidas", style: TextStyle(fontSize: 14, color: Colors.black))
                      ],
                    ),
                  ),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8, right: 10, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("TRAP", style: TextStyle(fontSize: 16))
                      ,Icon(Icons.delete_forever, color: Colors.red),
                      Icon(Icons.play_circle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}