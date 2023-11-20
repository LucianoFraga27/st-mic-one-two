// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listar_curtidas_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listarCurtidasViewModelHash() =>
    r'0bbe655211e30c2916f11829133de42901faa808';

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

abstract class _$ListarCurtidasViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ListarCurtidasViewState> {
  late final int? idUsuario;

  FutureOr<ListarCurtidasViewState> build({
    int? idUsuario,
  });
}

/// See also [ListarCurtidasViewModel].
@ProviderFor(ListarCurtidasViewModel)
const listarCurtidasViewModelProvider = ListarCurtidasViewModelFamily();

/// See also [ListarCurtidasViewModel].
class ListarCurtidasViewModelFamily
    extends Family<AsyncValue<ListarCurtidasViewState>> {
  /// See also [ListarCurtidasViewModel].
  const ListarCurtidasViewModelFamily();

  /// See also [ListarCurtidasViewModel].
  ListarCurtidasViewModelProvider call({
    int? idUsuario,
  }) {
    return ListarCurtidasViewModelProvider(
      idUsuario: idUsuario,
    );
  }

  @override
  ListarCurtidasViewModelProvider getProviderOverride(
    covariant ListarCurtidasViewModelProvider provider,
  ) {
    return call(
      idUsuario: provider.idUsuario,
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
  String? get name => r'listarCurtidasViewModelProvider';
}

/// See also [ListarCurtidasViewModel].
class ListarCurtidasViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ListarCurtidasViewModel,
        ListarCurtidasViewState> {
  /// See also [ListarCurtidasViewModel].
  ListarCurtidasViewModelProvider({
    int? idUsuario,
  }) : this._internal(
          () => ListarCurtidasViewModel()..idUsuario = idUsuario,
          from: listarCurtidasViewModelProvider,
          name: r'listarCurtidasViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listarCurtidasViewModelHash,
          dependencies: ListarCurtidasViewModelFamily._dependencies,
          allTransitiveDependencies:
              ListarCurtidasViewModelFamily._allTransitiveDependencies,
          idUsuario: idUsuario,
        );

  ListarCurtidasViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idUsuario,
  }) : super.internal();

  final int? idUsuario;

  @override
  FutureOr<ListarCurtidasViewState> runNotifierBuild(
    covariant ListarCurtidasViewModel notifier,
  ) {
    return notifier.build(
      idUsuario: idUsuario,
    );
  }

  @override
  Override overrideWith(ListarCurtidasViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListarCurtidasViewModelProvider._internal(
        () => create()..idUsuario = idUsuario,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idUsuario: idUsuario,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ListarCurtidasViewModel,
      ListarCurtidasViewState> createElement() {
    return _ListarCurtidasViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListarCurtidasViewModelProvider &&
        other.idUsuario == idUsuario;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idUsuario.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListarCurtidasViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ListarCurtidasViewState> {
  /// The parameter `idUsuario` of this provider.
  int? get idUsuario;
}

class _ListarCurtidasViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListarCurtidasViewModel,
        ListarCurtidasViewState> with ListarCurtidasViewModelRef {
  _ListarCurtidasViewModelProviderElement(super.provider);

  @override
  int? get idUsuario => (origin as ListarCurtidasViewModelProvider).idUsuario;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
