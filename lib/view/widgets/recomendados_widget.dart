import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

class RecomendadosWidget extends StatefulWidget {
  RecomendadosWidget({super.key});

  @override
  State<RecomendadosWidget> createState() => _RecomendadosWidgetState();
}

class _RecomendadosWidgetState extends State<RecomendadosWidget> {
  ThemeColors themeColors = ThemeColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // color: const Color.fromARGB(255, 255, 241, 240),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0, bottom: 2.0),
            child: Text(
              "Em alta",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 53, 53, 53)),
            ),
          ),
          Container(
            height: 200, // Defina a altura desejada para a lista horizontal
            child: ListView.separated(
              scrollDirection: Axis.horizontal, // Define o eixo horizontal
              itemBuilder: (BuildContext context, int index) {
                return _recomendadoWidget(context);
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 0); // Espaçamento entre os itens
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _recomendadoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0, left: 3.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0, right: 2.0, left: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2), // Cor da sombra
                                        spreadRadius:
                                            2, // Raio de propagação da sombra
                                        blurRadius:
                                            4, // Raio de desfoque da sombra
                                        offset: const Offset(3,
                                            3), // Deslocamento da sombra (horizontal, vertical)
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      "assets/capa_music.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "2P - ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black, // Cor do "2P"
                                  ),
                                ),
                                TextSpan(
                                  text: "De Manhã",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black, // Cor do texto
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
