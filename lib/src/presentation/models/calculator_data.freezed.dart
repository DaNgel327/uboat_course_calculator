// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculatorData {
  int get course => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorDataCopyWith<CalculatorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorDataCopyWith<$Res> {
  factory $CalculatorDataCopyWith(
          CalculatorData value, $Res Function(CalculatorData) then) =
      _$CalculatorDataCopyWithImpl<$Res, CalculatorData>;
  @useResult
  $Res call({int course});
}

/// @nodoc
class _$CalculatorDataCopyWithImpl<$Res, $Val extends CalculatorData>
    implements $CalculatorDataCopyWith<$Res> {
  _$CalculatorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
  }) {
    return _then(_value.copyWith(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculatorDataImplCopyWith<$Res>
    implements $CalculatorDataCopyWith<$Res> {
  factory _$$CalculatorDataImplCopyWith(_$CalculatorDataImpl value,
          $Res Function(_$CalculatorDataImpl) then) =
      __$$CalculatorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int course});
}

/// @nodoc
class __$$CalculatorDataImplCopyWithImpl<$Res>
    extends _$CalculatorDataCopyWithImpl<$Res, _$CalculatorDataImpl>
    implements _$$CalculatorDataImplCopyWith<$Res> {
  __$$CalculatorDataImplCopyWithImpl(
      _$CalculatorDataImpl _value, $Res Function(_$CalculatorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
  }) {
    return _then(_$CalculatorDataImpl(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CalculatorDataImpl extends _CalculatorData {
  const _$CalculatorDataImpl({required this.course}) : super._();

  @override
  final int course;

  @override
  String toString() {
    return 'CalculatorData(course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorDataImpl &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode => Object.hash(runtimeType, course);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorDataImplCopyWith<_$CalculatorDataImpl> get copyWith =>
      __$$CalculatorDataImplCopyWithImpl<_$CalculatorDataImpl>(
          this, _$identity);
}

abstract class _CalculatorData extends CalculatorData {
  const factory _CalculatorData({required final int course}) =
      _$CalculatorDataImpl;
  const _CalculatorData._() : super._();

  @override
  int get course;
  @override
  @JsonKey(ignore: true)
  _$$CalculatorDataImplCopyWith<_$CalculatorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
