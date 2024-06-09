// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseParameters {
  num get distance => throw _privateConstructorUsedError;
  Scope get scope => throw _privateConstructorUsedError;
  num get periscopeScaleValue => throw _privateConstructorUsedError;
  num get boatLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseParametersCopyWith<CourseParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseParametersCopyWith<$Res> {
  factory $CourseParametersCopyWith(
          CourseParameters value, $Res Function(CourseParameters) then) =
      _$CourseParametersCopyWithImpl<$Res, CourseParameters>;
  @useResult
  $Res call(
      {num distance, Scope scope, num periscopeScaleValue, num boatLength});
}

/// @nodoc
class _$CourseParametersCopyWithImpl<$Res, $Val extends CourseParameters>
    implements $CourseParametersCopyWith<$Res> {
  _$CourseParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? scope = null,
    Object? periscopeScaleValue = null,
    Object? boatLength = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as Scope,
      periscopeScaleValue: null == periscopeScaleValue
          ? _value.periscopeScaleValue
          : periscopeScaleValue // ignore: cast_nullable_to_non_nullable
              as num,
      boatLength: null == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseParametersImplCopyWith<$Res>
    implements $CourseParametersCopyWith<$Res> {
  factory _$$CourseParametersImplCopyWith(_$CourseParametersImpl value,
          $Res Function(_$CourseParametersImpl) then) =
      __$$CourseParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num distance, Scope scope, num periscopeScaleValue, num boatLength});
}

/// @nodoc
class __$$CourseParametersImplCopyWithImpl<$Res>
    extends _$CourseParametersCopyWithImpl<$Res, _$CourseParametersImpl>
    implements _$$CourseParametersImplCopyWith<$Res> {
  __$$CourseParametersImplCopyWithImpl(_$CourseParametersImpl _value,
      $Res Function(_$CourseParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? scope = null,
    Object? periscopeScaleValue = null,
    Object? boatLength = null,
  }) {
    return _then(_$CourseParametersImpl(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as Scope,
      periscopeScaleValue: null == periscopeScaleValue
          ? _value.periscopeScaleValue
          : periscopeScaleValue // ignore: cast_nullable_to_non_nullable
              as num,
      boatLength: null == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$CourseParametersImpl implements _CourseParameters {
  const _$CourseParametersImpl(
      {required this.distance,
      required this.scope,
      required this.periscopeScaleValue,
      required this.boatLength});

  @override
  final num distance;
  @override
  final Scope scope;
  @override
  final num periscopeScaleValue;
  @override
  final num boatLength;

  @override
  String toString() {
    return 'CourseParameters(distance: $distance, scope: $scope, periscopeScaleValue: $periscopeScaleValue, boatLength: $boatLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseParametersImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.periscopeScaleValue, periscopeScaleValue) ||
                other.periscopeScaleValue == periscopeScaleValue) &&
            (identical(other.boatLength, boatLength) ||
                other.boatLength == boatLength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, distance, scope, periscopeScaleValue, boatLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseParametersImplCopyWith<_$CourseParametersImpl> get copyWith =>
      __$$CourseParametersImplCopyWithImpl<_$CourseParametersImpl>(
          this, _$identity);
}

abstract class _CourseParameters implements CourseParameters {
  const factory _CourseParameters(
      {required final num distance,
      required final Scope scope,
      required final num periscopeScaleValue,
      required final num boatLength}) = _$CourseParametersImpl;

  @override
  num get distance;
  @override
  Scope get scope;
  @override
  num get periscopeScaleValue;
  @override
  num get boatLength;
  @override
  @JsonKey(ignore: true)
  _$$CourseParametersImplCopyWith<_$CourseParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
