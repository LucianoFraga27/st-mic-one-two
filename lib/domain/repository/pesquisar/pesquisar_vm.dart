
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pesquisar_vm.g.dart';

class PesquisarViewState {
  final dynamic musicas;

  PesquisarViewState({
    required this.musicas,
  });

 PesquisarViewState copyWith({
    dynamic musicas,
  }) {
    return PesquisarViewState(
      musicas: musicas ?? this.musicas,
    
    );
  }
}

@riverpod
class PesquisarViewModel extends _$PesquisarViewModel {
  Future<List<dynamic>> _listarMusicasTop(String pesquisa) => ref
      .watch(pesquisaRepositoryProvider)
      .pesquisarMusica(pesquisa);
  @override
  Future<PesquisarViewState> build({String? pesquisa}
      ) async {
    state = const AsyncValue.loading();

   
      final musicasCurtidas = await _listarMusicasTop(pesquisa ?? "");

      return PesquisarViewState(
          musicas: musicasCurtidas,
          );
    
      }
}