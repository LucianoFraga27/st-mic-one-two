import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_repository.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/listar_musicas_curtidas_repository.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/listar_musicas_curtidas_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_riverpod_repository.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_riverpod_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/usuario_repo.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/usuario_repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();


@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) =>
    LoginRepositoryImpl(restClient: ref.read(restClientProvider));


@Riverpod(keepAlive: true)
UsuarioRiverpod usuarioRiverpod(UsuarioRiverpodRef ref) =>
    UsuarioRepoImpl(restClient: ref.read(restClientProvider));


@Riverpod(keepAlive: true)
MusicaRiverpodRepository musicaRiverpodRepository(MusicaRiverpodRepositoryRef ref) => 
  MusicaRiverpodRepositoryImpl(restClient: ref.read(restClientProvider));

  @Riverpod(keepAlive: true)
  
  ListarMusicasCurtidasRepository listarMusicasCurtidasRepository(ListarMusicasCurtidasRepositoryRef ref) => 
  ListarMusicasCurtidasRepositoryImpl(restClient: ref.read(restClientProvider));

    @Riverpod(keepAlive: true)
  CurtidaOuNaoRepository curtidaOuNaoRepository(CurtidaOuNaoRepositoryRef ref) => 
  CurtidaOuNaoRepositoryImpl(restClient: ref.read(restClientProvider));