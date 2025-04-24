// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_with_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpWithEmailParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  /// Create a copy of SignUpWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpWithEmailParamsCopyWith<SignUpWithEmailParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailParamsCopyWith<$Res> {
  factory $SignUpWithEmailParamsCopyWith(SignUpWithEmailParams value,
          $Res Function(SignUpWithEmailParams) then) =
      _$SignUpWithEmailParamsCopyWithImpl<$Res, SignUpWithEmailParams>;
  @useResult
  $Res call({String email, String password, String username});
}

/// @nodoc
class _$SignUpWithEmailParamsCopyWithImpl<$Res,
        $Val extends SignUpWithEmailParams>
    implements $SignUpWithEmailParamsCopyWith<$Res> {
  _$SignUpWithEmailParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpWithEmailParamsImplCopyWith<$Res>
    implements $SignUpWithEmailParamsCopyWith<$Res> {
  factory _$$SignUpWithEmailParamsImplCopyWith(
          _$SignUpWithEmailParamsImpl value,
          $Res Function(_$SignUpWithEmailParamsImpl) then) =
      __$$SignUpWithEmailParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String username});
}

/// @nodoc
class __$$SignUpWithEmailParamsImplCopyWithImpl<$Res>
    extends _$SignUpWithEmailParamsCopyWithImpl<$Res,
        _$SignUpWithEmailParamsImpl>
    implements _$$SignUpWithEmailParamsImplCopyWith<$Res> {
  __$$SignUpWithEmailParamsImplCopyWithImpl(_$SignUpWithEmailParamsImpl _value,
      $Res Function(_$SignUpWithEmailParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_$SignUpWithEmailParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpWithEmailParamsImpl implements _SignUpWithEmailParams {
  const _$SignUpWithEmailParamsImpl(
      {required this.email, required this.password, required this.username});

  @override
  final String email;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'SignUpWithEmailParams(email: $email, password: $password, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpWithEmailParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, username);

  /// Create a copy of SignUpWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpWithEmailParamsImplCopyWith<_$SignUpWithEmailParamsImpl>
      get copyWith => __$$SignUpWithEmailParamsImplCopyWithImpl<
          _$SignUpWithEmailParamsImpl>(this, _$identity);
}

abstract class _SignUpWithEmailParams implements SignUpWithEmailParams {
  const factory _SignUpWithEmailParams(
      {required final String email,
      required final String password,
      required final String username}) = _$SignUpWithEmailParamsImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get username;

  /// Create a copy of SignUpWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpWithEmailParamsImplCopyWith<_$SignUpWithEmailParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
