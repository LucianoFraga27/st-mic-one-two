import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerUrl_2 extends StatefulWidget {
  @override
  _AudioPlayerUrlState createState() => _AudioPlayerUrlState();
}

class _AudioPlayerUrlState extends State<AudioPlayerUrl_2> {
 
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.paused;
  String url =
      "https://onetwo-arquivos-estudo.s3.us-east-2.amazonaws.com/catalogo/3d168237-3068-437d-abbc-41c40f9cfc25_2P%20calli.%20V%C3%A1rias%20T%C3%A1ticas%20MASTER%20V1.mp3";

  int timeProgress = 0;
  int audioDuration = 0;
 Widget slider() {
    return Container(
      width: 50.0,
      child: Slider.adaptive(
        
        activeColor: Colors.black87,
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    audioPlayer.setSource(UrlSource(
        url)); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await audioPlayer.play(UrlSource(url));
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                SizedBox(width: 20,),
                IconButton(
                    iconSize: 35,
                    onPressed: () {
                      audioPlayerState == PlayerState.playing
                          ? pauseMusic()
                          : playMusic();
                    },
                    icon: Icon(audioPlayerState == PlayerState.playing
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded)),
                        SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: Icon(Icons.share_rounded))
              ],
            ),

            Column(
              children: [
                Container(width: 300, child: slider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTimeString(timeProgress)),
                      SizedBox(width: 100),
                      Text(getTimeString(audioDuration))
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
