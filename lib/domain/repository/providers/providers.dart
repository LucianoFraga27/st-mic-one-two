import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_repository.dart';
import 'package:mic_check_one_two/domain/repository/curtida/musica_curtidaounao/curtida_ou_nao_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/listar_musicas_curtidas_repository.dart';
import 'package:mic_check_one_two/domain/repository/curtida/riverpod/listar_musicas_curtidas_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/listarSeguidores/listar_seguidores_repository.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_riverpod_repository.dart';
import 'package:mic_check_one_two/domain/repository/musica/riverpod/musica_riverpod_repository_impl.dart';
import 'package:mic_check_one_two/domain/repository/representacaoUsuario/representacao_usuario_repository.dart';
import 'package:mic_check_one_two/domain/repository/seguindo/riverpod/seguindo_repository.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/usuario_repo.dart';
import 'package:mic_check_one_two/domain/repository/usuario/riverpod/usuario_repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../seguir/riverpod/seguir_repository.dart';
import '../seguir/riverpod/seguir_repository_impl.dart';

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
MusicaRiverpodRepository musicaRiverpodRepository(
        MusicaRiverpodRepositoryRef ref) =>
    MusicaRiverpodRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
ListarMusicasCurtidasRepository listarMusicasCurtidasRepository(
        ListarMusicasCurtidasRepositoryRef ref) =>
    ListarMusicasCurtidasRepositoryImpl(
        restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
CurtidaOuNaoRepository curtidaOuNaoRepository(CurtidaOuNaoRepositoryRef ref) =>
    CurtidaOuNaoRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
SeguirRepository seguirRepositoryRepository(SeguirRepositoryRepositoryRef ref) =>
    SeguirRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
SeguindoRepository seguindoRepository(SeguindoRepositoryRef ref) =>
    SeguindoRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
RepresentacaousuarioRepository representacaousuarioRepository(RepresentacaousuarioRepositoryRef ref) =>
    RepresentacaousuarioRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
ListarSeguidoresRepository listarSeguidoresRepository(ListarSeguidoresRepositoryRef ref) =>
    ListarSeguidoresRepositoryImpl(restClient: ref.read(restClientProvider));


