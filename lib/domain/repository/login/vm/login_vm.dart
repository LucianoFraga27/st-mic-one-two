import 'package:mic_check_one_two/domain/repository/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

class LoginViewState {
  final dynamic login;
  LoginViewState({required this.login});

  LoginViewState copyWith({
    dynamic login,
  }) {
    return LoginViewState(
      login: login ?? this.login,
    );
  }
}

@riverpod
class LoginViewModel extends _$LoginViewModel {
  Future<dynamic> _login(String username, String password) =>
      ref.watch(loginRepositoryProvider).login(username, password);

  Future<LoginViewState> build({String? username, String? password}) async {
    state = const AsyncValue.loading();

    final loginResponse = await _login(username ?? "", password ?? "");
    return LoginViewState(login: loginResponse);
  }
}
