import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'musica_vm.g.dart';

class MusicaViewState {

  final List<dynamic> musicasDoUsuario;


  MusicaViewState({

    required this.musicasDoUsuario,

  });

  MusicaViewState copyWith({

    List<dynamic>? musicasDoUsuario,

  }) {
    return MusicaViewState(

      musicasDoUsuario: musicasDoUsuario ?? this.musicasDoUsuario,

    );
  }
}

@riverpod
class MusicaViewModel extends _$MusicaViewModel {
  Future<List<dynamic>> _listarMusicasDoUsuario(int idUsuario) => ref
      .watch(musicaRiverpodRepositoryProvider)
      .listarMusicasDoUsuario(idUsuario);
  @override
  Future<MusicaViewState> build(
      {int? id, int? idUsuario, String? pesquisa}) async {
    state = const AsyncValue.loading();

   


      final musicasDoUsuario = await _listarMusicasDoUsuario(idUsuario ?? 1);


      return MusicaViewState(

          musicasDoUsuario: musicasDoUsuario,
 );
    
      }
}
