
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'representacaousuario_vm.g.dart';
class RepresentacaousuarioViewState {

  dynamic usuario;

  RepresentacaousuarioViewState({
    required this.usuario,
  });


  RepresentacaousuarioViewState copyWith({
    dynamic? usuario,
  }) {
    return RepresentacaousuarioViewState(
      usuario: usuario ?? this.usuario,
    );
  }
  
}

  @riverpod
  class RepresentacaousuarioVm extends _$RepresentacaousuarioVm {
    Future<dynamic> _representacaoUsuario() =>
      ref.watch(representacaousuarioRepositoryProvider).representacaoUsuario();
   
 @override
  Future<RepresentacaousuarioViewState> build(
      {String? id, String? textoBuscar, bool? repertorio}) async {
    
    state = const AsyncValue.loading();

    final usuario = await _representacaoUsuario();

    return RepresentacaousuarioViewState(
        usuario: usuario);
  }
  }

