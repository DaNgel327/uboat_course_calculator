import '../constants/course_constants.dart';

class CourseFormatter {
  static String getCourse(int acute, int obtuse) =>
      '$acute${CourseConstants.degreeSymbol}'
      '/'
      '$obtuse${CourseConstants.degreeSymbol}';
}
