import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_state.g.dart';

class UsuarioState {
  final dynamic usuario;

  UsuarioState({
    required this.usuario,
  });

  UsuarioState copyWith({
    dynamic usuario
  }) {
    return UsuarioState(
      usuario: usuario ?? this.usuario,
     );
  }
  
  }

  @riverpod
  class UsuarioVm extends _$UsuarioVm {
    Future<dynamic> _representacaoUsuario() =>
      ref.watch(usuarioRiverpodProvider).representacaoUsuario(id.toString());
   
 @override
  Future<UsuarioState> build(
      {String? id, String? textoBuscar, bool? repertorio}) async {
    
    state = const AsyncValue.loading();

    final usuario = await _representacaoUsuario();

    return UsuarioState(
        usuario: usuario);
  }
  }