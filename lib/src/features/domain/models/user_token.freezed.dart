// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return _UserToken.fromJson(json);
}

/// @nodoc
mixin _$UserToken {
  String get token => throw _privateConstructorUsedError;
  String get userCode => throw _privateConstructorUsedError;

  /// Serializes this UserToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTokenCopyWith<UserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenCopyWith<$Res> {
  factory $UserTokenCopyWith(UserToken value, $Res Function(UserToken) then) =
      _$UserTokenCopyWithImpl<$Res, UserToken>;
  @useResult
  $Res call({String token, String userCode});
}

/// @nodoc
class _$UserTokenCopyWithImpl<$Res, $Val extends UserToken>
    implements $UserTokenCopyWith<$Res> {
  _$UserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userCode = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTokenImplCopyWith<$Res>
    implements $UserTokenCopyWith<$Res> {
  factory _$$UserTokenImplCopyWith(
          _$UserTokenImpl value, $Res Function(_$UserTokenImpl) then) =
      __$$UserTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String userCode});
}

/// @nodoc
class __$$UserTokenImplCopyWithImpl<$Res>
    extends _$UserTokenCopyWithImpl<$Res, _$UserTokenImpl>
    implements _$$UserTokenImplCopyWith<$Res> {
  __$$UserTokenImplCopyWithImpl(
      _$UserTokenImpl _value, $Res Function(_$UserTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userCode = null,
  }) {
    return _then(_$UserTokenImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      userCode: null == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTokenImpl implements _UserToken {
  _$UserTokenImpl({this.token = '', this.userCode = ''});

  factory _$UserTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTokenImplFromJson(json);

  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final String userCode;

  @override
  String toString() {
    return 'UserToken(token: $token, userCode: $userCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, userCode);

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      __$$UserTokenImplCopyWithImpl<_$UserTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTokenImplToJson(
      this,
    );
  }
}

abstract class _UserToken implements UserToken {
  factory _UserToken({final String token, final String userCode}) =
      _$UserTokenImpl;

  factory _UserToken.fromJson(Map<String, dynamic> json) =
      _$UserTokenImpl.fromJson;

  @override
  String get token;
  @override
  String get userCode;

  /// Create a copy of UserToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTokenImplCopyWith<_$UserTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
