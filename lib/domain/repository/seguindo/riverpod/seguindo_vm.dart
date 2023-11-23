import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seguindo_vm.g.dart';

class SeguindoViewState {
  final List<dynamic> musicas;

    SeguindoViewState({
    required this.musicas
  });

  SeguindoViewState copyWith({
    dynamic musicas    
  }) {
    return SeguindoViewState(
          musicas: musicas ?? this.musicas
    );
  }



}

@riverpod
class SeguindoViewModel extends _$SeguindoViewModel {
  Future<List<dynamic>> _listarMusicasDoSeguindo() => ref
      .watch(seguindoRepositoryProvider).listarMusicasDoSeguindo();
  @override
  Future<SeguindoViewState> build(
      {int? idMusica}) async {
    state = const AsyncValue.loading();

      final musicas = await _listarMusicasDoSeguindo();

      return SeguindoViewState(
          musicas: musicas,
          );
    
      }
}