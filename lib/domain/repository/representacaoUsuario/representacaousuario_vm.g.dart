// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representacaousuario_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$representacaousuarioVmHash() =>
    r'416420101bd28fb13f9370c815747990814a955f';

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

abstract class _$RepresentacaousuarioVm
    extends BuildlessAutoDisposeAsyncNotifier<RepresentacaousuarioViewState> {
  late final String? id;
  late final String? textoBuscar;
  late final bool? repertorio;

  FutureOr<RepresentacaousuarioViewState> build({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  });
}

/// See also [RepresentacaousuarioVm].
@ProviderFor(RepresentacaousuarioVm)
const representacaousuarioVmProvider = RepresentacaousuarioVmFamily();

/// See also [RepresentacaousuarioVm].
class RepresentacaousuarioVmFamily
    extends Family<AsyncValue<RepresentacaousuarioViewState>> {
  /// See also [RepresentacaousuarioVm].
  const RepresentacaousuarioVmFamily();

  /// See also [RepresentacaousuarioVm].
  RepresentacaousuarioVmProvider call({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  }) {
    return RepresentacaousuarioVmProvider(
      id: id,
      textoBuscar: textoBuscar,
      repertorio: repertorio,
    );
  }

  @override
  RepresentacaousuarioVmProvider getProviderOverride(
    covariant RepresentacaousuarioVmProvider provider,
  ) {
    return call(
      id: provider.id,
      textoBuscar: provider.textoBuscar,
      repertorio: provider.repertorio,
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
  String? get name => r'representacaousuarioVmProvider';
}

/// See also [RepresentacaousuarioVm].
class RepresentacaousuarioVmProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RepresentacaousuarioVm,
        RepresentacaousuarioViewState> {
  /// See also [RepresentacaousuarioVm].
  RepresentacaousuarioVmProvider({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  }) : this._internal(
          () => RepresentacaousuarioVm()
            ..id = id
            ..textoBuscar = textoBuscar
            ..repertorio = repertorio,
          from: representacaousuarioVmProvider,
          name: r'representacaousuarioVmProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$representacaousuarioVmHash,
          dependencies: RepresentacaousuarioVmFamily._dependencies,
          allTransitiveDependencies:
              RepresentacaousuarioVmFamily._allTransitiveDependencies,
          id: id,
          textoBuscar: textoBuscar,
          repertorio: repertorio,
        );

  RepresentacaousuarioVmProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.textoBuscar,
    required this.repertorio,
  }) : super.internal();

  final String? id;
  final String? textoBuscar;
  final bool? repertorio;

  @override
  FutureOr<RepresentacaousuarioViewState> runNotifierBuild(
    covariant RepresentacaousuarioVm notifier,
  ) {
    return notifier.build(
      id: id,
      textoBuscar: textoBuscar,
      repertorio: repertorio,
    );
  }

  @override
  Override overrideWith(RepresentacaousuarioVm Function() create) {
    return ProviderOverride(
      origin: this,
      override: RepresentacaousuarioVmProvider._internal(
        () => create()
          ..id = id
          ..textoBuscar = textoBuscar
          ..repertorio = repertorio,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        textoBuscar: textoBuscar,
        repertorio: repertorio,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RepresentacaousuarioVm,
      RepresentacaousuarioViewState> createElement() {
    return _RepresentacaousuarioVmProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepresentacaousuarioVmProvider &&
        other.id == id &&
        other.textoBuscar == textoBuscar &&
        other.repertorio == repertorio;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, textoBuscar.hashCode);
    hash = _SystemHash.combine(hash, repertorio.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepresentacaousuarioVmRef
    on AutoDisposeAsyncNotifierProviderRef<RepresentacaousuarioViewState> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `textoBuscar` of this provider.
  String? get textoBuscar;

  /// The parameter `repertorio` of this provider.
  bool? get repertorio;
}

class _RepresentacaousuarioVmProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RepresentacaousuarioVm,
        RepresentacaousuarioViewState> with RepresentacaousuarioVmRef {
  _RepresentacaousuarioVmProviderElement(super.provider);

  @override
  String? get id => (origin as RepresentacaousuarioVmProvider).id;
  @override
  String? get textoBuscar =>
      (origin as RepresentacaousuarioVmProvider).textoBuscar;
  @override
  bool? get repertorio => (origin as RepresentacaousuarioVmProvider).repertorio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
