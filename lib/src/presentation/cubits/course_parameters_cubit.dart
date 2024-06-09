import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uboat_course_calculator/src/domain/enums/parameter_type.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart' as tdc;
import 'package:uboat_course_calculator/src/presentation/models/calculator_data.dart';

part 'course_parameters_cubit.freezed.dart';

part 'course_parameters_state.dart';

@singleton
class CourseParametersCubit extends Cubit<CourseParametersState> {
  CourseParametersCubit() : super(const CourseParametersState());

  void setDistance(num distance) {
    emit(state.copyWith(distance: distance));
  }

  void setScope(tdc.Scope scope) {
    emit(state.copyWith(scope: scope));
  }

  void setPeriscopeScaleValue(num periscopeScaleValue) {
    emit(state.copyWith(scale: periscopeScaleValue));
  }

  void setBoatLength(num boatLength) {
    emit(state.copyWith(boatLength: boatLength));
  }

  void onCalculatePressed() => calculateCourse();

  void calculateCourse() {
    final aSinResult =
        asin(state.distance! / state.scope!.value * state.scale! / state.boatLength!) * (180 / pi);
    emit(state.copyWith(course: CalculatorData(course: aSinResult.round())));
  }
}
