import 'package:mic_check_one_two/domain/model/genero_musical.dart';

abstract interface class  MusicaRiverpodRepository {
  Future<List<dynamic>> listarByGenero ();
  Future<List<dynamic>> listarMusicasTop ();
  Future<dynamic> encontrarMusicaPeloId (int id);
  Future<List<dynamic>> listarMusicasDoUsuario (int idUsuario);
  Future<List<dynamic>> pesquisarMusica (String pesquisa);
}
