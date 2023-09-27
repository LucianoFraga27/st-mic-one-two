import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

class CurtidasWidget extends StatefulWidget {
  CurtidasWidget({super.key});

  @override
  State<CurtidasWidget> createState() => _CurtidasWidgetState();
}

class _CurtidasWidgetState extends State<CurtidasWidget> {
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
              "Curtidas",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 53, 53, 53)),
            ),
          ),
          Column(
            children: [
              for (int index = 0; index < 5; index++)
                _recomendadoWidget(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recomendadoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0, left: 3.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: themeColors.gradient),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.0,
                                  right: 2.0,
                                  left: 5,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      "assets/capa_music.png",
                                      fit: BoxFit.fill,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.45,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "De Manhã",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(Icons.share_rounded, size: 17),
                                    ],
                                  ),
                                ),
                                const Text(
                                  "2P",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.45,
                                  // color: Colors.red,
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.play_circle_outline,
                                          size: 25, color: Colors.white),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Icon(Icons.favorite,
                                          size: 25,
                                          color: Color.fromARGB(255, 78, 5, 0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
