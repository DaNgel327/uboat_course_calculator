part of 'course_parameters_cubit.dart';

@freezed
class CourseParametersState with _$CourseParametersState {
  const factory CourseParametersState({
    @Default(null) CourseParameters? courseParameters,
    @Default(null) CalculatorData? course,
  }) = _CourseParametersState;
}
