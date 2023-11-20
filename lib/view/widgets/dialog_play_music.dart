import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/pages/perfiL_do_usuario_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';

class MusicDialog extends StatefulWidget {
  MusicDialog({required this.audio, required this.autor, required this.autorId, required this.capa, required this.musicaId, required this.titulo});
  String musicaId;
  String titulo;
  String autorId;
  String autor;
  String capa;
  String audio;
  @override
  _MusicDialogState createState() => _MusicDialogState(audio: audio, musicaId:  musicaId, autor: autor, autorId: autorId, capa: capa, titulo: titulo);
}

class _MusicDialogState extends State<MusicDialog> with WidgetsBindingObserver {
  _MusicDialogState({required this.audio, required this.autor, required this.autorId, required this.capa, required this.musicaId, required this.titulo});
  
  bool isPlaying = false;
  bool isFavorite = false;
  
  String musicaId;
  String titulo;
  String autorId;
  String autor;
  String capa;
  String audio;


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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration (
         
        ),
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: ThemeColors().branco
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height:50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 190, 150, 240),
                       Color.fromARGB(255, 210, 173, 255), // Adicione outras cores se desejar um gradiente mais complexo
                    ],
                  ),
                   boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Cor da sombra
                          spreadRadius: 1, // Raio de propagação da sombra
                          blurRadius: 10, // Raio de desfoque da sombra
                          offset: const Offset(0,
                              1), // Deslocamento da sombra (horizontal, vertical)
                        ),
                      ],
                  ),
                  
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // IconButton(
                          //   icon: Icon(Icons.close),
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          SizedBox(height: 20,)
                        ],
                      ),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                            capa, // Substitua pelo caminho da capa da música
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        titulo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PerfilDoUsuarioPage(
                                      id: int.tryParse(autorId) ?? 0
                                          
                                    ),
                                  ),
                                );
                        },
                        child: Text(
                          autor,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 0),
                      AudioPlayerUrl(url: audio,id:musicaId)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
