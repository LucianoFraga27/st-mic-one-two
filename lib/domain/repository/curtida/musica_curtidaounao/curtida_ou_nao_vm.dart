import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'curtida_ou_nao_vm.g.dart';

class CurtidaOuNaoViewState {
  final dynamic curtiu;

    CurtidaOuNaoViewState({
    required this.curtiu
  });

  CurtidaOuNaoViewState copyWith({
    dynamic curtiu    
  }) {
    return CurtidaOuNaoViewState(
          curtiu: curtiu ?? this.curtiu
    );
  }



}

@riverpod
class CurtidaOuNaoViewModel extends _$CurtidaOuNaoViewModel {
  Future<bool> _listarCurtidasDoUsuariox(int idMusica) => ref
      .watch(curtidaOuNaoRepositoryProvider).curtiuOuNao(idMusica);
  @override
  Future<CurtidaOuNaoViewState> build(
      {int? idMusica}) async {
    state = const AsyncValue.loading();

      final curtida = await _listarCurtidasDoUsuariox(idMusica ?? 1);

      return CurtidaOuNaoViewState(
          curtiu: curtida,
          );
    
      }
}