// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeSessionHash() => r'958bd14b0320d8e99eb89a688aeb19ce063dd280';

/// See also [activeSession].
@ProviderFor(activeSession)
final activeSessionProvider = AutoDisposeProvider<Session?>.internal(
  activeSession,
  name: r'activeSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveSessionRef = AutoDisposeProviderRef<Session?>;
String _$sessionStateNotifierHash() =>
    r'4cade66bd81e6256aafcfd5af85df03e27986058';

/// See also [SessionStateNotifier].
@ProviderFor(SessionStateNotifier)
final sessionStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    SessionStateNotifier, SessionState>.internal(
  SessionStateNotifier.new,
  name: r'sessionStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionStateNotifier = AutoDisposeAsyncNotifier<SessionState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
