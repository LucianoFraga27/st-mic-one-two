import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/dialog_play_music.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class SeguindoWidget extends StatelessWidget {
  SeguindoWidget({super.key});

  ThemeColors themeColors = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromARGB(255, 190, 150, 240),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Cor da sombra
                    spreadRadius: 1, // Raio de propagação da sombra
                    blurRadius: 10, // Raio de desfoque da sombra
                    offset: const Offset(
                        0, 1), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          child: Image.network(
                              'https://onetwo-arquivos-estudo.s3.us-east-2.amazonaws.com/catalogo/f2e58320-d552-40ba-8d70-85aedc4d3408_10.png'),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Era uma vez",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255))),
                            Text("Carlinhos",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)))
                          ],
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8, right: 10, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "FUNK",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 208, 208, 208)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                          ),
                           onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(
                            builder: (context) => Container(),
                            // -------- musicawidget
                          ),);
                          },
                        ),
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
