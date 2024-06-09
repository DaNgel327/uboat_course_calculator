part of 'course_calculator_cubit.dart';

@freezed
class CourseCalculatorState with _$CourseCalculatorState {
  const factory CourseCalculatorState({
    @Default(null) num? distance,
    @Default(null) scope.Scope? scope,
    @Default(null) num? scale,
    @Default(null) num? boatLength,
  }) = _CourseCalculatorState;

  const CourseCalculatorState._();

  bool get isReady => distance != null && this.scope != null && scale != null && boatLength != null;
}
