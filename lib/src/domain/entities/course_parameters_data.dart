import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uboat_course_calculator/src/domain/enums/parameter_type.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

part 'course_parameters_data.freezed.dart';

@freezed
class CourseParametersData with _$CourseParametersData {
  const factory CourseParametersData({
    required String subtitle,
    required ParameterType parameterType,
    required List<PickerItem<num>> data,
    @Default('') String imagePath,
    @Default('') String title,
    @Default(TDCTheme.grey) Color startColor,
    @Default(TDCTheme.grey) Color endColor,
    @Default(0) num initValue,
    @Default('') String units,
  }) = _CourseParametersData;
}
