import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart';

part 'course_parameters.freezed.dart';

@freezed
class CourseParameters with _$CourseParameters {
  const factory CourseParameters({
    required num distance,
    required Scope scope,
    required num periscopeScaleValue,
    required num boatLength,
  }) = _CourseParameters;
}
