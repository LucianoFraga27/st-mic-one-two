import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/app_bar.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_famoso.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class DestaqueTopUmWidget extends StatefulWidget {
  const DestaqueTopUmWidget({super.key});

  @override
  State<DestaqueTopUmWidget> createState() => _DestaqueTopUmWidgetState();
}

class _DestaqueTopUmWidgetState extends State<DestaqueTopUmWidget> {
 ThemeColors themeColors = ThemeColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:0, right: 20, left: 20, bottom: 0),
      margin: EdgeInsets.only(top:5, right: 0, left: 0, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
         gradient: themeColors.gradient4,
        boxShadow: [
           BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // deslocação vertical e horizontal
                ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTopHeader(),
          SizedBox(height: 10),
          buildMusicInfo(),
          //AudioPlayerUrl(),
        ],
      ),
    );
  }

  Widget buildTopHeader() {
    return Text(
  "Top #1",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);
  }

  Widget buildMusicInfo() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Arredonda a imagem
              child: Image.asset(
                "assets/capa_music.png",
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "De Manhã",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                  onTap: () {
                    dialogPerfilFamoso(context);
                  },
                  child: Text(
                    "2P",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                )
                  ],
                ),
                SizedBox(width: 110,),
                IconButton(onPressed: () {}, icon: Icon(Icons.play_circle_fill,size:40, color: Colors.white54,))
              ],
            ),
            
          ],
        ),
        
      ],
    );
  }
}
