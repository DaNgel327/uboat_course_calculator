import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';
import 'package:uboat_course_calculator/src/domain/utils/result.dart';

abstract interface class CourseParametersRepository {
  Future<Result<void>> setCourseParameters(CourseParameters courseParameters);

  Future<Result<CourseParameters>> get courseParameters;
}
