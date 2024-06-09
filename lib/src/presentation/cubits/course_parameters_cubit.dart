import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart' as scope;
import 'package:uboat_course_calculator/src/domain/repositories/course_parameters_repository.dart';
import 'package:uboat_course_calculator/src/presentation/models/calculator_data.dart';

part 'course_parameters_state.dart';

part 'course_parameters_cubit.freezed.dart';

@injectable
class CourseParametersCubit extends Cubit<CourseParametersState> {
  CourseParametersCubit(this._courseParametersRepository) : super(const CourseParametersState());

  final CourseParametersRepository _courseParametersRepository;

  void setDistance(num distance) {
    emit(state.copyWith(courseParameters: state.courseParameters?.copyWith(distance: distance)));
  }

  void setScope(scope.Scope scope) {
    emit(state.copyWith(courseParameters: state.courseParameters?.copyWith(scope: scope)));
  }

  void setPeriscopeScaleValue(num periscopeScaleValue) {
    emit(
      state.copyWith(
        courseParameters:
            state.courseParameters?.copyWith(periscopeScaleValue: periscopeScaleValue),
      ),
    );
  }

  void setBoatLength(num boatLength) {
    emit(
      state.copyWith(courseParameters: state.courseParameters?.copyWith(boatLength: boatLength)),
    );
  }

  Future<void> saveCourseParameters() async {
    final courseParameters = state.courseParameters;
    if (courseParameters == null) return;
    await _courseParametersRepository.setCourseParameters(courseParameters);
  }

  void calculateCourse(CourseParameters model) {
    final aSinResult =
        asin(model.distance / model.scope.value * model.periscopeScaleValue / model.boatLength) *
            (180 / pi);
    emit(state.copyWith(course: CalculatorData(course: aSinResult.round())));
  }
}
