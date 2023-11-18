import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'musica_vm.g.dart';

class MusicaViewState {
  final dynamic musica;
  final List<dynamic> musicasDoUsuario;
  final List<dynamic> musicasDoGenero;
  final List<dynamic> musicasTop;
  final List<dynamic> musicasPesquisa;

  MusicaViewState({
    required this.musica,
    required this.musicasDoUsuario,
    required this.musicasDoGenero,
    required this.musicasTop,
    required this.musicasPesquisa,
  });

  MusicaViewState copyWith({
    dynamic musica,
    List<dynamic>? musicasDoUsuario,
    List<dynamic>? musicasDoGenero,
    List<dynamic>? musicasTop,
    List<dynamic>? musicasPesquisa,
  }) {
    return MusicaViewState(
      musica: musica ?? this.musica,
      musicasDoUsuario: musicasDoUsuario ?? this.musicasDoUsuario,
      musicasDoGenero: musicasDoGenero ?? this.musicasDoGenero,
      musicasTop: musicasTop ?? this.musicasTop,
      musicasPesquisa: musicasPesquisa ?? this.musicasPesquisa,
    );
  }
}

@riverpod
class MusicaViewModel extends _$MusicaViewModel {
  Future<List<dynamic>> _listarByGenero() =>
      ref.watch(musicaRiverpodRepositoryProvider).listarByGenero();
  Future<List<dynamic>> _listarMusicasTop() =>
      ref.watch(musicaRiverpodRepositoryProvider).listarMusicasTop();
  Future<dynamic> _encontrarMusicaPeloId(int id) =>
      ref.watch(musicaRiverpodRepositoryProvider).encontrarMusicaPeloId(id);
  Future<List<dynamic>> _listarMusicasDoUsuario(int idUsuario) => ref
      .watch(musicaRiverpodRepositoryProvider)
      .listarMusicasDoUsuario(idUsuario);
  Future<List<dynamic>> _pesquisarMusica(String pesquisa) =>
      ref.watch(musicaRiverpodRepositoryProvider).pesquisarMusica(pesquisa);
  @override
  Future<MusicaViewState> build(
      {int? id, int? idUsuario, String? pesquisa}) async {
    state = const AsyncValue.loading();

   
      final musica = await _listarMusicasTop();
      final musicasDoGenero = await _listarByGenero();
      final musicasDoUsuario = await _listarMusicasDoUsuario(idUsuario ?? 1);
      final musicasPesquisa =  await _pesquisarMusica(pesquisa ?? "");
      final musicasTop = await _listarMusicasTop();

      return MusicaViewState(
          musica: musica,
          musicasDoGenero: musicasDoGenero,
          musicasDoUsuario: musicasDoUsuario,
          musicasPesquisa: musicasPesquisa,
          musicasTop: musicasTop);
    
      }
}
