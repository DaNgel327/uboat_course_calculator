// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_parameters_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseParametersState {
  num? get distance => throw _privateConstructorUsedError;
  tdc.Scope? get scope => throw _privateConstructorUsedError;
  num? get scale => throw _privateConstructorUsedError;
  num? get boatLength => throw _privateConstructorUsedError;
  CalculatorData? get course => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseParametersStateCopyWith<CourseParametersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseParametersStateCopyWith<$Res> {
  factory $CourseParametersStateCopyWith(CourseParametersState value,
          $Res Function(CourseParametersState) then) =
      _$CourseParametersStateCopyWithImpl<$Res, CourseParametersState>;
  @useResult
  $Res call(
      {num? distance,
      tdc.Scope? scope,
      num? scale,
      num? boatLength,
      CalculatorData? course});

  $CalculatorDataCopyWith<$Res>? get course;
}

/// @nodoc
class _$CourseParametersStateCopyWithImpl<$Res,
        $Val extends CourseParametersState>
    implements $CourseParametersStateCopyWith<$Res> {
  _$CourseParametersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? scope = freezed,
    Object? scale = freezed,
    Object? boatLength = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as tdc.Scope?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as num?,
      boatLength: freezed == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as CalculatorData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CalculatorDataCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CalculatorDataCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseParametersStateImplCopyWith<$Res>
    implements $CourseParametersStateCopyWith<$Res> {
  factory _$$CourseParametersStateImplCopyWith(
          _$CourseParametersStateImpl value,
          $Res Function(_$CourseParametersStateImpl) then) =
      __$$CourseParametersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? distance,
      tdc.Scope? scope,
      num? scale,
      num? boatLength,
      CalculatorData? course});

  @override
  $CalculatorDataCopyWith<$Res>? get course;
}

/// @nodoc
class __$$CourseParametersStateImplCopyWithImpl<$Res>
    extends _$CourseParametersStateCopyWithImpl<$Res,
        _$CourseParametersStateImpl>
    implements _$$CourseParametersStateImplCopyWith<$Res> {
  __$$CourseParametersStateImplCopyWithImpl(_$CourseParametersStateImpl _value,
      $Res Function(_$CourseParametersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? scope = freezed,
    Object? scale = freezed,
    Object? boatLength = freezed,
    Object? course = freezed,
  }) {
    return _then(_$CourseParametersStateImpl(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as tdc.Scope?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as num?,
      boatLength: freezed == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as CalculatorData?,
    ));
  }
}

/// @nodoc

class _$CourseParametersStateImpl extends _CourseParametersState {
  const _$CourseParametersStateImpl(
      {this.distance = null,
      this.scope = null,
      this.scale = null,
      this.boatLength = null,
      this.course = null})
      : super._();

  @override
  @JsonKey()
  final num? distance;
  @override
  @JsonKey()
  final tdc.Scope? scope;
  @override
  @JsonKey()
  final num? scale;
  @override
  @JsonKey()
  final num? boatLength;
  @override
  @JsonKey()
  final CalculatorData? course;

  @override
  String toString() {
    return 'CourseParametersState(distance: $distance, scope: $scope, scale: $scale, boatLength: $boatLength, course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseParametersStateImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.boatLength, boatLength) ||
                other.boatLength == boatLength) &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, distance, scope, scale, boatLength, course);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseParametersStateImplCopyWith<_$CourseParametersStateImpl>
      get copyWith => __$$CourseParametersStateImplCopyWithImpl<
          _$CourseParametersStateImpl>(this, _$identity);
}

abstract class _CourseParametersState extends CourseParametersState {
  const factory _CourseParametersState(
      {final num? distance,
      final tdc.Scope? scope,
      final num? scale,
      final num? boatLength,
      final CalculatorData? course}) = _$CourseParametersStateImpl;
  const _CourseParametersState._() : super._();

  @override
  num? get distance;
  @override
  tdc.Scope? get scope;
  @override
  num? get scale;
  @override
  num? get boatLength;
  @override
  CalculatorData? get course;
  @override
  @JsonKey(ignore: true)
  _$$CourseParametersStateImplCopyWith<_$CourseParametersStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
