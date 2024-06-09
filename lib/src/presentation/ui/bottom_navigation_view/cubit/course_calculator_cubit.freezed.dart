// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_calculator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseCalculatorState {
  num? get distance => throw _privateConstructorUsedError;
  scope.Scope? get scope => throw _privateConstructorUsedError;
  num? get scale => throw _privateConstructorUsedError;
  num? get boatLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseCalculatorStateCopyWith<CourseCalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCalculatorStateCopyWith<$Res> {
  factory $CourseCalculatorStateCopyWith(CourseCalculatorState value,
          $Res Function(CourseCalculatorState) then) =
      _$CourseCalculatorStateCopyWithImpl<$Res, CourseCalculatorState>;
  @useResult
  $Res call({num? distance, scope.Scope? scope, num? scale, num? boatLength});
}

/// @nodoc
class _$CourseCalculatorStateCopyWithImpl<$Res,
        $Val extends CourseCalculatorState>
    implements $CourseCalculatorStateCopyWith<$Res> {
  _$CourseCalculatorStateCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as scope.Scope?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as num?,
      boatLength: freezed == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseCalculatorStateImplCopyWith<$Res>
    implements $CourseCalculatorStateCopyWith<$Res> {
  factory _$$CourseCalculatorStateImplCopyWith(
          _$CourseCalculatorStateImpl value,
          $Res Function(_$CourseCalculatorStateImpl) then) =
      __$$CourseCalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? distance, scope.Scope? scope, num? scale, num? boatLength});
}

/// @nodoc
class __$$CourseCalculatorStateImplCopyWithImpl<$Res>
    extends _$CourseCalculatorStateCopyWithImpl<$Res,
        _$CourseCalculatorStateImpl>
    implements _$$CourseCalculatorStateImplCopyWith<$Res> {
  __$$CourseCalculatorStateImplCopyWithImpl(_$CourseCalculatorStateImpl _value,
      $Res Function(_$CourseCalculatorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? scope = freezed,
    Object? scale = freezed,
    Object? boatLength = freezed,
  }) {
    return _then(_$CourseCalculatorStateImpl(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as scope.Scope?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as num?,
      boatLength: freezed == boatLength
          ? _value.boatLength
          : boatLength // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

class _$CourseCalculatorStateImpl extends _CourseCalculatorState {
  const _$CourseCalculatorStateImpl(
      {this.distance = null,
      this.scope = null,
      this.scale = null,
      this.boatLength = null})
      : super._();

  @override
  @JsonKey()
  final num? distance;
  @override
  @JsonKey()
  final scope.Scope? scope;
  @override
  @JsonKey()
  final num? scale;
  @override
  @JsonKey()
  final num? boatLength;

  @override
  String toString() {
    return 'CourseCalculatorState(distance: $distance, scope: $scope, scale: $scale, boatLength: $boatLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseCalculatorStateImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.boatLength, boatLength) ||
                other.boatLength == boatLength));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, distance, scope, scale, boatLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseCalculatorStateImplCopyWith<_$CourseCalculatorStateImpl>
      get copyWith => __$$CourseCalculatorStateImplCopyWithImpl<
          _$CourseCalculatorStateImpl>(this, _$identity);
}

abstract class _CourseCalculatorState extends CourseCalculatorState {
  const factory _CourseCalculatorState(
      {final num? distance,
      final scope.Scope? scope,
      final num? scale,
      final num? boatLength}) = _$CourseCalculatorStateImpl;
  const _CourseCalculatorState._() : super._();

  @override
  num? get distance;
  @override
  scope.Scope? get scope;
  @override
  num? get scale;
  @override
  num? get boatLength;
  @override
  @JsonKey(ignore: true)
  _$$CourseCalculatorStateImplCopyWith<_$CourseCalculatorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
