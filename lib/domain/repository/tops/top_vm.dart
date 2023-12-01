
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_vm.g.dart';

class TopViewState {
  final dynamic musicas;

  TopViewState({
    required this.musicas,
  });

 TopViewState copyWith({
    dynamic musicas,
  }) {
    return TopViewState(
      musicas: musicas ?? this.musicas,
    
    );
  }
}

@riverpod
class TopViewModel extends _$TopViewModel {
  Future<List<dynamic>> _listarMusicasTop() => ref
      .watch(topRepositoryProvider)
      .listarMusicasTop();
  @override
  Future<TopViewState> build(
      ) async {
    state = const AsyncValue.loading();

   
      final musicasCurtidas = await _listarMusicasTop();

      return TopViewState(
          musicas: musicasCurtidas,
          );
    
      }
}