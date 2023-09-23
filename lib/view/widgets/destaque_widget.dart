import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

class DestaqueWidget extends StatelessWidget {
  DestaqueWidget({super.key});

  ThemeColors themeColors = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Text(
            "Lotando as casas de show",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: themeColors.gradient),
                child: Stack(
                  children: [
                    Positioned(
                      right:
                          8.0, // Ajuste a posição horizontal conforme necessário
                      bottom:
                          8.0, // Ajuste a posição vertical conforme necessário
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons
                                  .play_circle_outline_rounded, // Ícone no canto inferior direito
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite, // Ícone no canto inferior direito
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/capa_music.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "De Manhã",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "2P",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
