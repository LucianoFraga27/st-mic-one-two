import 'package:mic_check_one_two/api/rest_client.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_impl.dart';
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

