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

    if (id == null && idUsuario == null && pesquisa == null) {
      final musica = [];
      final musicasDoGenero = await _listarByGenero();
      final musicasDoUsuario = [];
      final musicasPesquisa = [];
      final musicasTop = await _listarMusicasTop();

      return MusicaViewState(
          musica: musica,
          musicasDoGenero: musicasDoGenero,
          musicasDoUsuario: musicasDoUsuario,
          musicasPesquisa: musicasPesquisa,
          musicasTop: musicasTop);
    }
    if (id != null && idUsuario == null && pesquisa == null) {
      final musica = await _encontrarMusicaPeloId(id);
      final musicasDoGenero = [];
      final musicasDoUsuario = [];
      final musicasPesquisa = [];
      final musicasTop = [];

      return MusicaViewState(
          musica: musica,
          musicasDoGenero: musicasDoGenero,
          musicasDoUsuario: musicasDoUsuario,
          musicasPesquisa: musicasPesquisa,
          musicasTop: musicasTop);
    }
    if (id != null && idUsuario != null && pesquisa == null) {
      final musica = [];
      final musicasDoGenero = [];
      final musicasDoUsuario = await _listarMusicasDoUsuario(idUsuario);
      final musicasPesquisa = [];
      final musicasTop = [];

      return MusicaViewState(
          musica: musica,
          musicasDoGenero: musicasDoGenero,
          musicasDoUsuario: musicasDoUsuario,
          musicasPesquisa: musicasPesquisa,
          musicasTop: musicasTop);
    } else {
      final musica = [];
      final musicasDoGenero = [];
      final musicasDoUsuario = [];
      final musicasPesquisa = await _pesquisarMusica(pesquisa ?? "");
      final musicasTop = [];

      return MusicaViewState(
          musica: musica,
          musicasDoGenero: musicasDoGenero,
          musicasDoUsuario: musicasDoUsuario,
          musicasPesquisa: musicasPesquisa,
          musicasTop: musicasTop);
    }
  }
}
