import 'package:uboat_course_calculator/src/data/models/dbo/course_parameters_dbo.dart';
import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart';

extension CourseParametersToModelMapper on CourseParametersDbo {
  CourseParameters toModel() => CourseParameters(
        distance: distance,
        scope: Scope.fromZoom(scope),
        periscopeScaleValue: periscopeScaleValue,
        boatLength: boatLength,
      );
}

extension CourseParametersToDboMapper on CourseParameters {
  CourseParametersDbo toDbo() => CourseParametersDbo(
        distance.toDouble(),
        scope.zoom.toDouble(),
        periscopeScaleValue.toDouble(),
        boatLength.toDouble(),
      );
}
