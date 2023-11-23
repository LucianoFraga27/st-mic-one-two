// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seguindo_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seguindoViewModelHash() => r'7bf75cc77867070eefc8f346443d719a0df1afa6';

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

abstract class _$SeguindoViewModel
    extends BuildlessAutoDisposeAsyncNotifier<SeguindoViewState> {
  late final int? idMusica;

  FutureOr<SeguindoViewState> build({
    int? idMusica,
  });
}

/// See also [SeguindoViewModel].
@ProviderFor(SeguindoViewModel)
const seguindoViewModelProvider = SeguindoViewModelFamily();

/// See also [SeguindoViewModel].
class SeguindoViewModelFamily extends Family<AsyncValue<SeguindoViewState>> {
  /// See also [SeguindoViewModel].
  const SeguindoViewModelFamily();

  /// See also [SeguindoViewModel].
  SeguindoViewModelProvider call({
    int? idMusica,
  }) {
    return SeguindoViewModelProvider(
      idMusica: idMusica,
    );
  }

  @override
  SeguindoViewModelProvider getProviderOverride(
    covariant SeguindoViewModelProvider provider,
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
  String? get name => r'seguindoViewModelProvider';
}

/// See also [SeguindoViewModel].
class SeguindoViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SeguindoViewModel, SeguindoViewState> {
  /// See also [SeguindoViewModel].
  SeguindoViewModelProvider({
    int? idMusica,
  }) : this._internal(
          () => SeguindoViewModel()..idMusica = idMusica,
          from: seguindoViewModelProvider,
          name: r'seguindoViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seguindoViewModelHash,
          dependencies: SeguindoViewModelFamily._dependencies,
          allTransitiveDependencies:
              SeguindoViewModelFamily._allTransitiveDependencies,
          idMusica: idMusica,
        );

  SeguindoViewModelProvider._internal(
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
  FutureOr<SeguindoViewState> runNotifierBuild(
    covariant SeguindoViewModel notifier,
  ) {
    return notifier.build(
      idMusica: idMusica,
    );
  }

  @override
  Override overrideWith(SeguindoViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeguindoViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SeguindoViewModel, SeguindoViewState>
      createElement() {
    return _SeguindoViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeguindoViewModelProvider && other.idMusica == idMusica;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idMusica.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeguindoViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<SeguindoViewState> {
  /// The parameter `idMusica` of this provider.
  int? get idMusica;
}

class _SeguindoViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SeguindoViewModel,
        SeguindoViewState> with SeguindoViewModelRef {
  _SeguindoViewModelProviderElement(super.provider);

  @override
  int? get idMusica => (origin as SeguindoViewModelProvider).idMusica;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
