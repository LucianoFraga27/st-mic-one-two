import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract interface class MusicaAddRepository2 {
  Future<void> adicionarMusica(String titulo, File arquivoAudio, XFile arquivoCapa, String genero);

}