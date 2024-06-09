part of 'course_parameters_cubit.dart';

@freezed
class CourseParametersState with _$CourseParametersState {
  const factory CourseParametersState({
    @Default(null) num? distance,
    @Default(null) tdc.Scope? scope,
    @Default(null) num? scale,
    @Default(null) num? boatLength,
    @Default(null) CalculatorData? course,
  }) = _CourseParametersState;

  const CourseParametersState._();

  bool get isAllFilled => distance != null && scope != null && scale != null && boatLength != null;

  bool isFilledByParameterType(ParameterType type) => switch (type) {
        ParameterType.distance => distance != null,
        ParameterType.scope => scope != null,
        ParameterType.scale => scale != null,
        ParameterType.boatLength => boatLength != null,
      };

  num? getParameterByType(ParameterType type) => switch (type) {
        ParameterType.distance => distance,
        ParameterType.scope => scope?.value,
        ParameterType.scale => scale,
        ParameterType.boatLength => boatLength,
      };
}
