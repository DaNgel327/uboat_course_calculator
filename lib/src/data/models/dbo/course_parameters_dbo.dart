import 'package:realm/realm.dart';

part 'course_parameters_dbo.realm.dart';

@RealmModel()
class _CourseParametersDbo {
  late double distance;
  late double scope;
  late double periscopeScaleValue;
  late double boatLength;
}
