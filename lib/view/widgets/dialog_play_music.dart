import 'package:flutter/material.dart';

class MusicDialog extends StatefulWidget {
  @override
  _MusicDialogState createState() => _MusicDialogState();
}

class _MusicDialogState extends State<MusicDialog> {
  bool isPlaying = false;
  bool isFavorite = false;

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
    // Lógica de reprodução da música aqui
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Positioned(
                  top: 10,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  'assets/capa_music.png', // Substitua pelo caminho da capa da música
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'De Manhã',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '2P',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ), // Ícone de reprodução/pausa
                  onPressed: togglePlay,
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ), // Ícone de curtir
                  onPressed: toggleFavorite,
                ),
                IconButton(
                  icon: Icon(Icons.share_rounded), // Ícone de compartilhar
                  onPressed: () {
                    // Lógica de compartilhamento
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              color: Colors.black,
              value: 0.5, // Substitua pelo progresso real da música
            ),
          ],
        ),
      ),
    );
  }
}
