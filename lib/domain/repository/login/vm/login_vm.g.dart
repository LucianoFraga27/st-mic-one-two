// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginViewModelHash() => r'f31264f376e8a40eb02a94cb09acc3926514dacd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LoginViewModel
    extends BuildlessAutoDisposeAsyncNotifier<LoginViewState> {
  late final String? username;
  late final String? password;

  FutureOr<LoginViewState> build({
    String? username,
    String? password,
  });
}

/// See also [LoginViewModel].
@ProviderFor(LoginViewModel)
const loginViewModelProvider = LoginViewModelFamily();

/// See also [LoginViewModel].
class LoginViewModelFamily extends Family<AsyncValue<LoginViewState>> {
  /// See also [LoginViewModel].
  const LoginViewModelFamily();

  /// See also [LoginViewModel].
  LoginViewModelProvider call({
    String? username,
    String? password,
  }) {
    return LoginViewModelProvider(
      username: username,
      password: password,
    );
  }

  @override
  LoginViewModelProvider getProviderOverride(
    covariant LoginViewModelProvider provider,
  ) {
    return call(
      username: provider.username,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginViewModelProvider';
}

/// See also [LoginViewModel].
class LoginViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LoginViewModel, LoginViewState> {
  /// See also [LoginViewModel].
  LoginViewModelProvider({
    String? username,
    String? password,
  }) : this._internal(
          () => LoginViewModel()
            ..username = username
            ..password = password,
          from: loginViewModelProvider,
          name: r'loginViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginViewModelHash,
          dependencies: LoginViewModelFamily._dependencies,
          allTransitiveDependencies:
              LoginViewModelFamily._allTransitiveDependencies,
          username: username,
          password: password,
        );

  LoginViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String? username;
  final String? password;

  @override
  FutureOr<LoginViewState> runNotifierBuild(
    covariant LoginViewModel notifier,
  ) {
    return notifier.build(
      username: username,
      password: password,
    );
  }

  @override
  Override overrideWith(LoginViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginViewModelProvider._internal(
        () => create()
          ..username = username
          ..password = password,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LoginViewModel, LoginViewState>
      createElement() {
    return _LoginViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginViewModelProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginViewModelRef on AutoDisposeAsyncNotifierProviderRef<LoginViewState> {
  /// The parameter `username` of this provider.
  String? get username;

  /// The parameter `password` of this provider.
  String? get password;
}

class _LoginViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LoginViewModel,
        LoginViewState> with LoginViewModelRef {
  _LoginViewModelProviderElement(super.provider);

  @override
  String? get username => (origin as LoginViewModelProvider).username;
  @override
  String? get password => (origin as LoginViewModelProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
