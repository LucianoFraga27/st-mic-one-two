// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seguir_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seguirOuNaoViewModelHash() =>
    r'3cf3dccf14768059b0f4a9d6d15a299ddc80a08c';

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

abstract class _$SeguirOuNaoViewModel
    extends BuildlessAutoDisposeAsyncNotifier<SeguirOuNaoViewState> {
  late final int? idMusica;

  FutureOr<SeguirOuNaoViewState> build({
    int? idMusica,
  });
}

/// See also [SeguirOuNaoViewModel].
@ProviderFor(SeguirOuNaoViewModel)
const seguirOuNaoViewModelProvider = SeguirOuNaoViewModelFamily();

/// See also [SeguirOuNaoViewModel].
class SeguirOuNaoViewModelFamily
    extends Family<AsyncValue<SeguirOuNaoViewState>> {
  /// See also [SeguirOuNaoViewModel].
  const SeguirOuNaoViewModelFamily();

  /// See also [SeguirOuNaoViewModel].
  SeguirOuNaoViewModelProvider call({
    int? idMusica,
  }) {
    return SeguirOuNaoViewModelProvider(
      idMusica: idMusica,
    );
  }

  @override
  SeguirOuNaoViewModelProvider getProviderOverride(
    covariant SeguirOuNaoViewModelProvider provider,
  ) {
    return call(
      idMusica: provider.idMusica,
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
  String? get name => r'seguirOuNaoViewModelProvider';
}

/// See also [SeguirOuNaoViewModel].
class SeguirOuNaoViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SeguirOuNaoViewModel, SeguirOuNaoViewState> {
  /// See also [SeguirOuNaoViewModel].
  SeguirOuNaoViewModelProvider({
    int? idMusica,
  }) : this._internal(
          () => SeguirOuNaoViewModel()..idMusica = idMusica,
          from: seguirOuNaoViewModelProvider,
          name: r'seguirOuNaoViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seguirOuNaoViewModelHash,
          dependencies: SeguirOuNaoViewModelFamily._dependencies,
          allTransitiveDependencies:
              SeguirOuNaoViewModelFamily._allTransitiveDependencies,
          idMusica: idMusica,
        );

  SeguirOuNaoViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idMusica,
  }) : super.internal();

  final int? idMusica;

  @override
  FutureOr<SeguirOuNaoViewState> runNotifierBuild(
    covariant SeguirOuNaoViewModel notifier,
  ) {
    return notifier.build(
      idMusica: idMusica,
    );
  }

  @override
  Override overrideWith(SeguirOuNaoViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeguirOuNaoViewModelProvider._internal(
        () => create()..idMusica = idMusica,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idMusica: idMusica,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SeguirOuNaoViewModel,
      SeguirOuNaoViewState> createElement() {
    return _SeguirOuNaoViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeguirOuNaoViewModelProvider && other.idMusica == idMusica;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idMusica.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeguirOuNaoViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<SeguirOuNaoViewState> {
  /// The parameter `idMusica` of this provider.
  int? get idMusica;
}

class _SeguirOuNaoViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SeguirOuNaoViewModel,
        SeguirOuNaoViewState> with SeguirOuNaoViewModelRef {
  _SeguirOuNaoViewModelProviderElement(super.provider);

  @override
  int? get idMusica => (origin as SeguirOuNaoViewModelProvider).idMusica;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
