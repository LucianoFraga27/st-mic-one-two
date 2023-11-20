import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listar_curtidas_vm.g.dart';

class ListarCurtidasViewState {
  final dynamic musicas;

  ListarCurtidasViewState({
    required this.musicas,
  });

 ListarCurtidasViewState copyWith({
    dynamic musicas,
  }) {
    return ListarCurtidasViewState(
      musicas: musicas ?? this.musicas,
    
    );
  }
}

@riverpod
class ListarCurtidasViewModel extends _$ListarCurtidasViewModel {
  Future<List<dynamic>> _listarCurtidasDoUsuariox(int idUsuario) => ref
      .watch(listarMusicasCurtidasRepositoryProvider)
      .listarCurtidasDoUsuariox(idUsuario);
  @override
  Future<ListarCurtidasViewState> build(
      {int? idUsuario}) async {
    state = const AsyncValue.loading();

   
      final musicasCurtidas = await _listarCurtidasDoUsuariox(idUsuario ?? 1);

      return ListarCurtidasViewState(
          musicas: musicasCurtidas,
          );
    
      }
}