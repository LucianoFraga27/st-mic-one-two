// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisar_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pesquisarViewModelHash() =>
    r'3f021f439addb1dd0d1023a765458c685490e693';

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

abstract class _$PesquisarViewModel
    extends BuildlessAutoDisposeAsyncNotifier<PesquisarViewState> {
  late final String? pesquisa;

  FutureOr<PesquisarViewState> build({
    String? pesquisa,
  });
}

/// See also [PesquisarViewModel].
@ProviderFor(PesquisarViewModel)
const pesquisarViewModelProvider = PesquisarViewModelFamily();

/// See also [PesquisarViewModel].
class PesquisarViewModelFamily extends Family<AsyncValue<PesquisarViewState>> {
  /// See also [PesquisarViewModel].
  const PesquisarViewModelFamily();

  /// See also [PesquisarViewModel].
  PesquisarViewModelProvider call({
    String? pesquisa,
  }) {
    return PesquisarViewModelProvider(
      pesquisa: pesquisa,
    );
  }

  @override
  PesquisarViewModelProvider getProviderOverride(
    covariant PesquisarViewModelProvider provider,
  ) {
    return call(
      pesquisa: provider.pesquisa,
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
  String? get name => r'pesquisarViewModelProvider';
}

/// See also [PesquisarViewModel].
class PesquisarViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PesquisarViewModel, PesquisarViewState> {
  /// See also [PesquisarViewModel].
  PesquisarViewModelProvider({
    String? pesquisa,
  }) : this._internal(
          () => PesquisarViewModel()..pesquisa = pesquisa,
          from: pesquisarViewModelProvider,
          name: r'pesquisarViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pesquisarViewModelHash,
          dependencies: PesquisarViewModelFamily._dependencies,
          allTransitiveDependencies:
              PesquisarViewModelFamily._allTransitiveDependencies,
          pesquisa: pesquisa,
        );

  PesquisarViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pesquisa,
  }) : super.internal();

  final String? pesquisa;

  @override
  FutureOr<PesquisarViewState> runNotifierBuild(
    covariant PesquisarViewModel notifier,
  ) {
    return notifier.build(
      pesquisa: pesquisa,
    );
  }

  @override
  Override overrideWith(PesquisarViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PesquisarViewModelProvider._internal(
        () => create()..pesquisa = pesquisa,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pesquisa: pesquisa,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PesquisarViewModel,
      PesquisarViewState> createElement() {
    return _PesquisarViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PesquisarViewModelProvider && other.pesquisa == pesquisa;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pesquisa.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PesquisarViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<PesquisarViewState> {
  /// The parameter `pesquisa` of this provider.
  String? get pesquisa;
}

class _PesquisarViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PesquisarViewModel,
        PesquisarViewState> with PesquisarViewModelRef {
  _PesquisarViewModelProviderElement(super.provider);

  @override
  String? get pesquisa => (origin as PesquisarViewModelProvider).pesquisa;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
