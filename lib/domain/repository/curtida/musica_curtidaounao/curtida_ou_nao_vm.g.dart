// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curtida_ou_nao_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$curtidaOuNaoViewModelHash() =>
    r'cbb570ee0ec5d272f81626f7531f7df82f74e5c5';

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

abstract class _$CurtidaOuNaoViewModel
    extends BuildlessAutoDisposeAsyncNotifier<CurtidaOuNaoViewState> {
  late final int? idMusica;

  FutureOr<CurtidaOuNaoViewState> build({
    int? idMusica,
  });
}

/// See also [CurtidaOuNaoViewModel].
@ProviderFor(CurtidaOuNaoViewModel)
const curtidaOuNaoViewModelProvider = CurtidaOuNaoViewModelFamily();

/// See also [CurtidaOuNaoViewModel].
class CurtidaOuNaoViewModelFamily
    extends Family<AsyncValue<CurtidaOuNaoViewState>> {
  /// See also [CurtidaOuNaoViewModel].
  const CurtidaOuNaoViewModelFamily();

  /// See also [CurtidaOuNaoViewModel].
  CurtidaOuNaoViewModelProvider call({
    int? idMusica,
  }) {
    return CurtidaOuNaoViewModelProvider(
      idMusica: idMusica,
    );
  }

  @override
  CurtidaOuNaoViewModelProvider getProviderOverride(
    covariant CurtidaOuNaoViewModelProvider provider,
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
  String? get name => r'curtidaOuNaoViewModelProvider';
}

/// See also [CurtidaOuNaoViewModel].
class CurtidaOuNaoViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CurtidaOuNaoViewModel,
        CurtidaOuNaoViewState> {
  /// See also [CurtidaOuNaoViewModel].
  CurtidaOuNaoViewModelProvider({
    int? idMusica,
  }) : this._internal(
          () => CurtidaOuNaoViewModel()..idMusica = idMusica,
          from: curtidaOuNaoViewModelProvider,
          name: r'curtidaOuNaoViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$curtidaOuNaoViewModelHash,
          dependencies: CurtidaOuNaoViewModelFamily._dependencies,
          allTransitiveDependencies:
              CurtidaOuNaoViewModelFamily._allTransitiveDependencies,
          idMusica: idMusica,
        );

  CurtidaOuNaoViewModelProvider._internal(
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
  FutureOr<CurtidaOuNaoViewState> runNotifierBuild(
    covariant CurtidaOuNaoViewModel notifier,
  ) {
    return notifier.build(
      idMusica: idMusica,
    );
  }

  @override
  Override overrideWith(CurtidaOuNaoViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurtidaOuNaoViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CurtidaOuNaoViewModel,
      CurtidaOuNaoViewState> createElement() {
    return _CurtidaOuNaoViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurtidaOuNaoViewModelProvider && other.idMusica == idMusica;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idMusica.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurtidaOuNaoViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<CurtidaOuNaoViewState> {
  /// The parameter `idMusica` of this provider.
  int? get idMusica;
}

class _CurtidaOuNaoViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CurtidaOuNaoViewModel,
        CurtidaOuNaoViewState> with CurtidaOuNaoViewModelRef {
  _CurtidaOuNaoViewModelProviderElement(super.provider);

  @override
  int? get idMusica => (origin as CurtidaOuNaoViewModelProvider).idMusica;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
