import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';

sealed class CourseCalculatorEvent {}

class CalculateEvent extends CourseCalculatorEvent {
  CalculateEvent(this.parameters);

  final CourseParameters parameters;
}
