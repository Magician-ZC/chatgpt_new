// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Settings {
  String? get apiKey => throw _privateConstructorUsedError;
  String? get httpProxy => throw _privateConstructorUsedError;
  String? get baseUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call({String? apiKey, String? httpProxy, String? baseUrl});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = freezed,
    Object? httpProxy = freezed,
    Object? baseUrl = freezed,
  }) {
    return _then(_value.copyWith(
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      httpProxy: freezed == httpProxy
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as String?,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? apiKey, String? httpProxy, String? baseUrl});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = freezed,
    Object? httpProxy = freezed,
    Object? baseUrl = freezed,
  }) {
    return _then(_$_Settings(
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      httpProxy: freezed == httpProxy
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as String?,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Settings implements _Settings {
  const _$_Settings({this.apiKey, this.httpProxy, this.baseUrl});

  @override
  final String? apiKey;
  @override
  final String? httpProxy;
  @override
  final String? baseUrl;

  @override
  String toString() {
    return 'Settings(apiKey: $apiKey, httpProxy: $httpProxy, baseUrl: $baseUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.httpProxy, httpProxy) ||
                other.httpProxy == httpProxy) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiKey, httpProxy, baseUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {final String? apiKey,
      final String? httpProxy,
      final String? baseUrl}) = _$_Settings;

  @override
  String? get apiKey;
  @override
  String? get httpProxy;
  @override
  String? get baseUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingItem {
  SettingKey get key => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  bool get multiline => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingItemCopyWith<SettingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingItemCopyWith<$Res> {
  factory $SettingItemCopyWith(
          SettingItem value, $Res Function(SettingItem) then) =
      _$SettingItemCopyWithImpl<$Res, SettingItem>;
  @useResult
  $Res call(
      {SettingKey key,
      String title,
      String? subtitle,
      bool multiline,
      String hint});
}

/// @nodoc
class _$SettingItemCopyWithImpl<$Res, $Val extends SettingItem>
    implements $SettingItemCopyWith<$Res> {
  _$SettingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? multiline = null,
    Object? hint = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as SettingKey,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      multiline: null == multiline
          ? _value.multiline
          : multiline // ignore: cast_nullable_to_non_nullable
              as bool,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingItemCopyWith<$Res>
    implements $SettingItemCopyWith<$Res> {
  factory _$$_SettingItemCopyWith(
          _$_SettingItem value, $Res Function(_$_SettingItem) then) =
      __$$_SettingItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SettingKey key,
      String title,
      String? subtitle,
      bool multiline,
      String hint});
}

/// @nodoc
class __$$_SettingItemCopyWithImpl<$Res>
    extends _$SettingItemCopyWithImpl<$Res, _$_SettingItem>
    implements _$$_SettingItemCopyWith<$Res> {
  __$$_SettingItemCopyWithImpl(
      _$_SettingItem _value, $Res Function(_$_SettingItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? multiline = null,
    Object? hint = null,
  }) {
    return _then(_$_SettingItem(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as SettingKey,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      multiline: null == multiline
          ? _value.multiline
          : multiline // ignore: cast_nullable_to_non_nullable
              as bool,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingItem implements _SettingItem {
  const _$_SettingItem(
      {required this.key,
      required this.title,
      this.subtitle,
      this.multiline = false,
      required this.hint});

  @override
  final SettingKey key;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  @JsonKey()
  final bool multiline;
  @override
  final String hint;

  @override
  String toString() {
    return 'SettingItem(key: $key, title: $title, subtitle: $subtitle, multiline: $multiline, hint: $hint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingItem &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.multiline, multiline) ||
                other.multiline == multiline) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, key, title, subtitle, multiline, hint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingItemCopyWith<_$_SettingItem> get copyWith =>
      __$$_SettingItemCopyWithImpl<_$_SettingItem>(this, _$identity);
}

abstract class _SettingItem implements SettingItem {
  const factory _SettingItem(
      {required final SettingKey key,
      required final String title,
      final String? subtitle,
      final bool multiline,
      required final String hint}) = _$_SettingItem;

  @override
  SettingKey get key;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  bool get multiline;
  @override
  String get hint;
  @override
  @JsonKey(ignore: true)
  _$$_SettingItemCopyWith<_$_SettingItem> get copyWith =>
      throw _privateConstructorUsedError;
}
