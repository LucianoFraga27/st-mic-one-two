import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seguir_vm.g.dart';

class SeguirOuNaoViewState {
  final dynamic segue;

    SeguirOuNaoViewState({
    required this.segue
  });

  SeguirOuNaoViewState copyWith({
    dynamic segue    
  }) {
    return SeguirOuNaoViewState(
          segue: segue ?? this.segue
    );
  }



}

@riverpod
class SeguirOuNaoViewModel extends _$SeguirOuNaoViewModel {
  Future<dynamic> _verificarSeSegue(int id) => ref
      .watch(seguirRepositoryRepositoryProvider).verificarSeSegue(id.toString());
  @override
  Future<SeguirOuNaoViewState> build(
      {int? idMusica}) async {
      state = const AsyncValue.loading();

      final seguidor = await _verificarSeSegue(idMusica ?? 1);

      return SeguirOuNaoViewState(
          segue: seguidor,
          );
    
      }
}