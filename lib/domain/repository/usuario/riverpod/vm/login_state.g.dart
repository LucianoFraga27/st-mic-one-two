// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usuarioVmHash() => r'd8a4ec26accafa4a4b3b03064bd6dc6bf926d12e';

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

abstract class _$UsuarioVm
    extends BuildlessAutoDisposeAsyncNotifier<UsuarioState> {
  late final String? id;
  late final String? textoBuscar;
  late final bool? repertorio;

  FutureOr<UsuarioState> build({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  });
}

/// See also [UsuarioVm].
@ProviderFor(UsuarioVm)
const usuarioVmProvider = UsuarioVmFamily();

/// See also [UsuarioVm].
class UsuarioVmFamily extends Family<AsyncValue<UsuarioState>> {
  /// See also [UsuarioVm].
  const UsuarioVmFamily();

  /// See also [UsuarioVm].
  UsuarioVmProvider call({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  }) {
    return UsuarioVmProvider(
      id: id,
      textoBuscar: textoBuscar,
      repertorio: repertorio,
    );
  }

  @override
  UsuarioVmProvider getProviderOverride(
    covariant UsuarioVmProvider provider,
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
  String? get name => r'usuarioVmProvider';
}

/// See also [UsuarioVm].
class UsuarioVmProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UsuarioVm, UsuarioState> {
  /// See also [UsuarioVm].
  UsuarioVmProvider({
    String? id,
    String? textoBuscar,
    bool? repertorio,
  }) : this._internal(
          () => UsuarioVm()
            ..id = id
            ..textoBuscar = textoBuscar
            ..repertorio = repertorio,
          from: usuarioVmProvider,
          name: r'usuarioVmProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$usuarioVmHash,
          dependencies: UsuarioVmFamily._dependencies,
          allTransitiveDependencies: UsuarioVmFamily._allTransitiveDependencies,
          id: id,
          textoBuscar: textoBuscar,
          repertorio: repertorio,
        );

  UsuarioVmProvider._internal(
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
  FutureOr<UsuarioState> runNotifierBuild(
    covariant UsuarioVm notifier,
  ) {
    return notifier.build(
      id: id,
      textoBuscar: textoBuscar,
      repertorio: repertorio,
    );
  }

  @override
  Override overrideWith(UsuarioVm Function() create) {
    return ProviderOverride(
      origin: this,
      override: UsuarioVmProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UsuarioVm, UsuarioState>
      createElement() {
    return _UsuarioVmProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UsuarioVmProvider &&
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

mixin UsuarioVmRef on AutoDisposeAsyncNotifierProviderRef<UsuarioState> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `textoBuscar` of this provider.
  String? get textoBuscar;

  /// The parameter `repertorio` of this provider.
  bool? get repertorio;
}

class _UsuarioVmProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UsuarioVm, UsuarioState>
    with UsuarioVmRef {
  _UsuarioVmProviderElement(super.provider);

  @override
  String? get id => (origin as UsuarioVmProvider).id;
  @override
  String? get textoBuscar => (origin as UsuarioVmProvider).textoBuscar;
  @override
  bool? get repertorio => (origin as UsuarioVmProvider).repertorio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
