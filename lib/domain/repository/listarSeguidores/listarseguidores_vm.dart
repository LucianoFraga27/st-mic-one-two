
import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listarseguidores_vm.g.dart';

class ListarseguidoresViewState {

  dynamic seguidores;

  ListarseguidoresViewState({
    required this.seguidores,
  });


  ListarseguidoresViewState copyWith({
    dynamic? seguidores,
  }) {
    return ListarseguidoresViewState(
      seguidores: seguidores ?? this.seguidores,
    );
  }
  
}

  @riverpod
  class ListarseguidoresVm extends _$ListarseguidoresVm {
    Future<dynamic> _listarSeguidores( String idUsuario) =>
      ref.watch(listarSeguidoresRepositoryProvider).listarSeguidores(idUsuario);
   
 @override
  Future<ListarseguidoresViewState> build(
      {required String idUsuario}) async {
    
    state = const AsyncValue.loading();

    final seguidores = await _listarSeguidores(idUsuario);

    return ListarseguidoresViewState(
        seguidores: seguidores);
  }
  }

