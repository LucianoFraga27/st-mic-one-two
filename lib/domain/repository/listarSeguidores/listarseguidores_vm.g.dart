// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listarseguidores_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listarseguidoresVmHash() =>
    r'fc98cb92e4650dd01bbc322fbba42fd2c5d767da';

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

abstract class _$ListarseguidoresVm
    extends BuildlessAutoDisposeAsyncNotifier<ListarseguidoresViewState> {
  late final String idUsuario;

  FutureOr<ListarseguidoresViewState> build({
    required String idUsuario,
  });
}

/// See also [ListarseguidoresVm].
@ProviderFor(ListarseguidoresVm)
const listarseguidoresVmProvider = ListarseguidoresVmFamily();

/// See also [ListarseguidoresVm].
class ListarseguidoresVmFamily
    extends Family<AsyncValue<ListarseguidoresViewState>> {
  /// See also [ListarseguidoresVm].
  const ListarseguidoresVmFamily();

  /// See also [ListarseguidoresVm].
  ListarseguidoresVmProvider call({
    required String idUsuario,
  }) {
    return ListarseguidoresVmProvider(
      idUsuario: idUsuario,
    );
  }

  @override
  ListarseguidoresVmProvider getProviderOverride(
    covariant ListarseguidoresVmProvider provider,
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
  String? get name => r'listarseguidoresVmProvider';
}

/// See also [ListarseguidoresVm].
class ListarseguidoresVmProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListarseguidoresVm, ListarseguidoresViewState> {
  /// See also [ListarseguidoresVm].
  ListarseguidoresVmProvider({
    required String idUsuario,
  }) : this._internal(
          () => ListarseguidoresVm()..idUsuario = idUsuario,
          from: listarseguidoresVmProvider,
          name: r'listarseguidoresVmProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listarseguidoresVmHash,
          dependencies: ListarseguidoresVmFamily._dependencies,
          allTransitiveDependencies:
              ListarseguidoresVmFamily._allTransitiveDependencies,
          idUsuario: idUsuario,
        );

  ListarseguidoresVmProvider._internal(
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
  FutureOr<ListarseguidoresViewState> runNotifierBuild(
    covariant ListarseguidoresVm notifier,
  ) {
    return notifier.build(
      idUsuario: idUsuario,
    );
  }

  @override
  Override overrideWith(ListarseguidoresVm Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListarseguidoresVmProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ListarseguidoresVm,
      ListarseguidoresViewState> createElement() {
    return _ListarseguidoresVmProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListarseguidoresVmProvider && other.idUsuario == idUsuario;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idUsuario.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListarseguidoresVmRef
    on AutoDisposeAsyncNotifierProviderRef<ListarseguidoresViewState> {
  /// The parameter `idUsuario` of this provider.
  String get idUsuario;
}

class _ListarseguidoresVmProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListarseguidoresVm,
        ListarseguidoresViewState> with ListarseguidoresVmRef {
  _ListarseguidoresVmProviderElement(super.provider);

  @override
  String get idUsuario => (origin as ListarseguidoresVmProvider).idUsuario;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
