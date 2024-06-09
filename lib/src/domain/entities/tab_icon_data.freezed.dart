// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_icon_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabIconData {
  String get imagePath => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get selectedImagePath => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabIconDataCopyWith<TabIconData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabIconDataCopyWith<$Res> {
  factory $TabIconDataCopyWith(
          TabIconData value, $Res Function(TabIconData) then) =
      _$TabIconDataCopyWithImpl<$Res, TabIconData>;
  @useResult
  $Res call(
      {String imagePath, int index, String selectedImagePath, bool isSelected});
}

/// @nodoc
class _$TabIconDataCopyWithImpl<$Res, $Val extends TabIconData>
    implements $TabIconDataCopyWith<$Res> {
  _$TabIconDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? index = null,
    Object? selectedImagePath = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      selectedImagePath: null == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabIconDataImplCopyWith<$Res>
    implements $TabIconDataCopyWith<$Res> {
  factory _$$TabIconDataImplCopyWith(
          _$TabIconDataImpl value, $Res Function(_$TabIconDataImpl) then) =
      __$$TabIconDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath, int index, String selectedImagePath, bool isSelected});
}

/// @nodoc
class __$$TabIconDataImplCopyWithImpl<$Res>
    extends _$TabIconDataCopyWithImpl<$Res, _$TabIconDataImpl>
    implements _$$TabIconDataImplCopyWith<$Res> {
  __$$TabIconDataImplCopyWithImpl(
      _$TabIconDataImpl _value, $Res Function(_$TabIconDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? index = null,
    Object? selectedImagePath = null,
    Object? isSelected = null,
  }) {
    return _then(_$TabIconDataImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      selectedImagePath: null == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TabIconDataImpl implements _TabIconData {
  const _$TabIconDataImpl(
      {this.imagePath = '',
      this.index = 0,
      this.selectedImagePath = '',
      this.isSelected = false});

  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final String selectedImagePath;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'TabIconData(imagePath: $imagePath, index: $index, selectedImagePath: $selectedImagePath, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabIconDataImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.selectedImagePath, selectedImagePath) ||
                other.selectedImagePath == selectedImagePath) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, imagePath, index, selectedImagePath, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabIconDataImplCopyWith<_$TabIconDataImpl> get copyWith =>
      __$$TabIconDataImplCopyWithImpl<_$TabIconDataImpl>(this, _$identity);
}

abstract class _TabIconData implements TabIconData {
  const factory _TabIconData(
      {final String imagePath,
      final int index,
      final String selectedImagePath,
      final bool isSelected}) = _$TabIconDataImpl;

  @override
  String get imagePath;
  @override
  int get index;
  @override
  String get selectedImagePath;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$TabIconDataImplCopyWith<_$TabIconDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
