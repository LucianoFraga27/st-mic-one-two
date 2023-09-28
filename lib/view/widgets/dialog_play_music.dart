import 'package:flutter/material.dart';

bool isFavorite = false;

void toggleFavorite() {
  isFavorite = !isFavorite;
}

dialogPlayMusic(context) {
  return showDialog(
    context: context,
    builder: (context) {
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
                    icon: Icon(Icons.play_arrow), // Ícone de reprodução
                    onPressed: () {
                      // Lógica de reprodução da música
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ), // Ícone de curtir
                    onPressed: toggleFavorite,
                  ),
                  IconButton(
                    icon: Icon(Icons.share_rounded), // Ícone de curtir
                    onPressed: toggleFavorite,
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
    },
  );
}
