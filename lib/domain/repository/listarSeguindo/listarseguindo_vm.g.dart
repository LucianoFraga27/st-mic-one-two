// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listarseguindo_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listarseguindoVmHash() => r'615a5f92d46378f99f6ac0b8674289a333058f60';

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

abstract class _$ListarseguindoVm
    extends BuildlessAutoDisposeAsyncNotifier<ListarseguindoViewState> {
  late final String idUsuario;

  FutureOr<ListarseguindoViewState> build({
    required String idUsuario,
  });
}

/// See also [ListarseguindoVm].
@ProviderFor(ListarseguindoVm)
const listarseguindoVmProvider = ListarseguindoVmFamily();

/// See also [ListarseguindoVm].
class ListarseguindoVmFamily
    extends Family<AsyncValue<ListarseguindoViewState>> {
  /// See also [ListarseguindoVm].
  const ListarseguindoVmFamily();

  /// See also [ListarseguindoVm].
  ListarseguindoVmProvider call({
    required String idUsuario,
  }) {
    return ListarseguindoVmProvider(
      idUsuario: idUsuario,
    );
  }

  @override
  ListarseguindoVmProvider getProviderOverride(
    covariant ListarseguindoVmProvider provider,
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
  String? get name => r'listarseguindoVmProvider';
}

/// See also [ListarseguindoVm].
class ListarseguindoVmProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListarseguindoVm, ListarseguindoViewState> {
  /// See also [ListarseguindoVm].
  ListarseguindoVmProvider({
    required String idUsuario,
  }) : this._internal(
          () => ListarseguindoVm()..idUsuario = idUsuario,
          from: listarseguindoVmProvider,
          name: r'listarseguindoVmProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listarseguindoVmHash,
          dependencies: ListarseguindoVmFamily._dependencies,
          allTransitiveDependencies:
              ListarseguindoVmFamily._allTransitiveDependencies,
          idUsuario: idUsuario,
        );

  ListarseguindoVmProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idUsuario,
  }) : super.internal();

  final String idUsuario;

  @override
  FutureOr<ListarseguindoViewState> runNotifierBuild(
    covariant ListarseguindoVm notifier,
  ) {
    return notifier.build(
      idUsuario: idUsuario,
    );
  }

  @override
  Override overrideWith(ListarseguindoVm Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListarseguindoVmProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ListarseguindoVm,
      ListarseguindoViewState> createElement() {
    return _ListarseguindoVmProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListarseguindoVmProvider && other.idUsuario == idUsuario;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idUsuario.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListarseguindoVmRef
    on AutoDisposeAsyncNotifierProviderRef<ListarseguindoViewState> {
  /// The parameter `idUsuario` of this provider.
  String get idUsuario;
}

class _ListarseguindoVmProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListarseguindoVm,
        ListarseguindoViewState> with ListarseguindoVmRef {
  _ListarseguindoVmProviderElement(super.provider);

  @override
  String get idUsuario => (origin as ListarseguindoVmProvider).idUsuario;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
