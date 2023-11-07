import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class MusicDialog extends StatefulWidget {
  @override
  _MusicDialogState createState() => _MusicDialogState();
}

class _MusicDialogState extends State<MusicDialog> with WidgetsBindingObserver {
  bool isPlaying = false;
  bool isFavorite = false;


  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
            
            SizedBox(height: 0),
            AudioPlayerUrl()
          ],
        ),
      ),
    );
  }
}
