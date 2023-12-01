
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pravoce_vm.g.dart';

class PravoceViewState {
  final dynamic musicas;

  PravoceViewState({
    required this.musicas,
  });

 PravoceViewState copyWith({
    dynamic musicas,
  }) {
    return PravoceViewState(
      musicas: musicas ?? this.musicas,
    
    );
  }
}

@riverpod
class PravoceViewModel extends _$PravoceViewModel {
  Future<List<dynamic>> _listarMusicasTop() => ref
      .watch(praVoceRepositoryProvider)
      .listarByGenero();
  @override
  Future<PravoceViewState> build(
      ) async {
    state = const AsyncValue.loading();

   
      final musicasCurtidas = await _listarMusicasTop();

      return PravoceViewState(
          musicas: musicasCurtidas,
          );
    
      }
}