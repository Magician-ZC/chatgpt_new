// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingListHash() => r'45bb4e57ad2252aa40709231325d56501fcc5390';

/// See also [settingList].
@ProviderFor(settingList)
final settingListProvider = AutoDisposeProvider<List<SettingItem>>.internal(
  settingList,
  name: r'settingListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingListRef = AutoDisposeProviderRef<List<SettingItem>>;
String _$settingStateHash() => r'28b52f75000195ec9d8f1180cfe22e13e9b40c63';

/// See also [SettingState].
@ProviderFor(SettingState)
final settingStateProvider =
    AutoDisposeAsyncNotifierProvider<SettingState, Settings>.internal(
  SettingState.new,
  name: r'settingStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingState = AutoDisposeAsyncNotifier<Settings>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
