// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_with_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInWithEmailParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of SignInWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInWithEmailParamsCopyWith<SignInWithEmailParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithEmailParamsCopyWith<$Res> {
  factory $SignInWithEmailParamsCopyWith(SignInWithEmailParams value,
          $Res Function(SignInWithEmailParams) then) =
      _$SignInWithEmailParamsCopyWithImpl<$Res, SignInWithEmailParams>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInWithEmailParamsCopyWithImpl<$Res,
        $Val extends SignInWithEmailParams>
    implements $SignInWithEmailParamsCopyWith<$Res> {
  _$SignInWithEmailParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInWithEmailParamsImplCopyWith<$Res>
    implements $SignInWithEmailParamsCopyWith<$Res> {
  factory _$$SignInWithEmailParamsImplCopyWith(
          _$SignInWithEmailParamsImpl value,
          $Res Function(_$SignInWithEmailParamsImpl) then) =
      __$$SignInWithEmailParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInWithEmailParamsImplCopyWithImpl<$Res>
    extends _$SignInWithEmailParamsCopyWithImpl<$Res,
        _$SignInWithEmailParamsImpl>
    implements _$$SignInWithEmailParamsImplCopyWith<$Res> {
  __$$SignInWithEmailParamsImplCopyWithImpl(_$SignInWithEmailParamsImpl _value,
      $Res Function(_$SignInWithEmailParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInWithEmailParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInWithEmailParamsImpl implements _SignInWithEmailParams {
  const _$SignInWithEmailParamsImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInWithEmailParams(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignInWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithEmailParamsImplCopyWith<_$SignInWithEmailParamsImpl>
      get copyWith => __$$SignInWithEmailParamsImplCopyWithImpl<
          _$SignInWithEmailParamsImpl>(this, _$identity);
}

abstract class _SignInWithEmailParams implements SignInWithEmailParams {
  const factory _SignInWithEmailParams(
      {required final String email,
      required final String password}) = _$SignInWithEmailParamsImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignInWithEmailParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInWithEmailParamsImplCopyWith<_$SignInWithEmailParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
