// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musica_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$musicaViewModelHash() => r'1610edf142ac8c6ecf449674f140869fdb0407ff';

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

abstract class _$MusicaViewModel
    extends BuildlessAutoDisposeAsyncNotifier<MusicaViewState> {
  late final int? id;
  late final int? idUsuario;
  late final String? pesquisa;

  FutureOr<MusicaViewState> build({
    int? id,
    int? idUsuario,
    String? pesquisa,
  });
}

/// See also [MusicaViewModel].
@ProviderFor(MusicaViewModel)
const musicaViewModelProvider = MusicaViewModelFamily();

/// See also [MusicaViewModel].
class MusicaViewModelFamily extends Family<AsyncValue<MusicaViewState>> {
  /// See also [MusicaViewModel].
  const MusicaViewModelFamily();

  /// See also [MusicaViewModel].
  MusicaViewModelProvider call({
    int? id,
    int? idUsuario,
    String? pesquisa,
  }) {
    return MusicaViewModelProvider(
      id: id,
      idUsuario: idUsuario,
      pesquisa: pesquisa,
    );
  }

  @override
  MusicaViewModelProvider getProviderOverride(
    covariant MusicaViewModelProvider provider,
  ) {
    return call(
      id: provider.id,
      idUsuario: provider.idUsuario,
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
  String? get name => r'musicaViewModelProvider';
}

/// See also [MusicaViewModel].
class MusicaViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MusicaViewModel, MusicaViewState> {
  /// See also [MusicaViewModel].
  MusicaViewModelProvider({
    int? id,
    int? idUsuario,
    String? pesquisa,
  }) : this._internal(
          () => MusicaViewModel()
            ..id = id
            ..idUsuario = idUsuario
            ..pesquisa = pesquisa,
          from: musicaViewModelProvider,
          name: r'musicaViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$musicaViewModelHash,
          dependencies: MusicaViewModelFamily._dependencies,
          allTransitiveDependencies:
              MusicaViewModelFamily._allTransitiveDependencies,
          id: id,
          idUsuario: idUsuario,
          pesquisa: pesquisa,
        );

  MusicaViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.idUsuario,
    required this.pesquisa,
  }) : super.internal();

  final int? id;
  final int? idUsuario;
  final String? pesquisa;

  @override
  FutureOr<MusicaViewState> runNotifierBuild(
    covariant MusicaViewModel notifier,
  ) {
    return notifier.build(
      id: id,
      idUsuario: idUsuario,
      pesquisa: pesquisa,
    );
  }

  @override
  Override overrideWith(MusicaViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MusicaViewModelProvider._internal(
        () => create()
          ..id = id
          ..idUsuario = idUsuario
          ..pesquisa = pesquisa,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        idUsuario: idUsuario,
        pesquisa: pesquisa,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MusicaViewModel, MusicaViewState>
      createElement() {
    return _MusicaViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MusicaViewModelProvider &&
        other.id == id &&
        other.idUsuario == idUsuario &&
        other.pesquisa == pesquisa;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, idUsuario.hashCode);
    hash = _SystemHash.combine(hash, pesquisa.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MusicaViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<MusicaViewState> {
  /// The parameter `id` of this provider.
  int? get id;

  /// The parameter `idUsuario` of this provider.
  int? get idUsuario;

  /// The parameter `pesquisa` of this provider.
  String? get pesquisa;
}

class _MusicaViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MusicaViewModel,
        MusicaViewState> with MusicaViewModelRef {
  _MusicaViewModelProviderElement(super.provider);

  @override
  int? get id => (origin as MusicaViewModelProvider).id;
  @override
  int? get idUsuario => (origin as MusicaViewModelProvider).idUsuario;
  @override
  String? get pesquisa => (origin as MusicaViewModelProvider).pesquisa;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
