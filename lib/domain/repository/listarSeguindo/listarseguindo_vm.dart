
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'listarseguindo_vm.g.dart';

class ListarseguindoViewState {

  dynamic seguindo;

  ListarseguindoViewState({
    required this.seguindo,
  });


  ListarseguindoViewState copyWith({
    dynamic? seguindo,
  }) {
    return ListarseguindoViewState(
      seguindo: seguindo ?? this.seguindo,
    );
  }
  
}

  @riverpod
  class ListarseguindoVm extends _$ListarseguindoVm {
    Future<dynamic> _Listarseguindo( String idUsuario) =>
      ref.watch(listarSeguindoRepositoryProvider).listarSeguindo(idUsuario);
   
 @override
  Future<ListarseguindoViewState> build(
      {required String idUsuario}) async {
    
    state = const AsyncValue.loading();

    final seguindo = await _Listarseguindo(idUsuario);

    return ListarseguindoViewState(
        seguindo: seguindo);
  }
  }

