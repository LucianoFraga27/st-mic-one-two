import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtir_repository.dart';
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_vm.dart';

class AudioPlayerUrl extends ConsumerStatefulWidget {
  AudioPlayerUrl({required this.url, required this.id});
  String url;
  String id;
  @override
  ConsumerState<AudioPlayerUrl> createState() =>
      _AudioPlayerUrlState(url: url, idmusica: id);
}

class _AudioPlayerUrlState extends ConsumerState<AudioPlayerUrl> {
  _AudioPlayerUrlState({required this.url, required this.idmusica});
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.paused;
  String url;
  String idmusica;
  bool favorite = false;
  int clicks = 0;
  late CurtiuRepository curtiuRepository;
  late SharedPreferences sp;
  void initializeObjects() async {
    curtiuRepository = CurtiuRepository(); // Inicialize seu CurtiuRepository
    sp = await SharedPreferences
        .getInstance(); // Inicialize seu SharedPreferences
  }

  int timeProgress = 0;
  int audioDuration = 0;
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: const Color.fromARGB(255, 222, 69, 249),
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
    initializeObjects();
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
    final curtidaVM = ref
        .watch(CurtidaOuNaoViewModelProvider(idMusica: int.tryParse(idmusica)));
    return Container(
        height: 150,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                curtidaVM.when(
                    data: (data) {
                      final CurtidaOuNaoViewState(:curtiu) = data;
                      return _curtirBTN(idmusica, curtiu);
                    },
                    error: (error, stackTrace) {
                      return Container();
                    },
                    loading: () => _curtirBTN(idmusica, false)),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () {
                      audioPlayerState == PlayerState.playing
                          ? pauseMusic()
                          : playMusic();
                    },
                    icon: Icon(audioPlayerState == PlayerState.playing
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded)),
                SizedBox(
                  width: 20,
                ),
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

  IconButton _curtirBTN(idMusica, curtiu) {
    if (clicks == 0) {
      setState(() {
        favorite = curtiu;
      });
    }
    return IconButton(
        onPressed: () {
          setState(() {
            clicks += 1;
            curtiuRepository.curtir(idMusica);
            favorite = !favorite;
            print(favorite);
          });
        },
        icon: Icon(
          Icons.favorite,
          color: favorite ? ThemeColors().favorite : Colors.white,
        ));
  }
}
