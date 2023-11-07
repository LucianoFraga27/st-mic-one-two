import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/dialog_perfil_famoso.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class DestaqueTopUmWidget extends StatefulWidget {
  const DestaqueTopUmWidget({super.key});

  @override
  State<DestaqueTopUmWidget> createState() => _DestaqueTopUmWidgetState();
}

class _DestaqueTopUmWidgetState extends State<DestaqueTopUmWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTopHeader(),
          SizedBox(height: 10),
          buildMusicInfo(),
          AudioPlayerUrl(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
