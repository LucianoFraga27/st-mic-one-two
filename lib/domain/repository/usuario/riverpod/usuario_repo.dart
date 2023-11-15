
abstract interface class UsuarioRiverpod {
  Future<dynamic> representacaoUsuario(String id);
  Future <List<dynamic>> listarSeguidoresDoUsuario(int id);
  Future <List<dynamic>> listarSeguindoDoUsuario(int id);

}