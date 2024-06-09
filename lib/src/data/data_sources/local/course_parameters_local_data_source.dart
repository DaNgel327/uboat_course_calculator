import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';
import 'package:uboat_course_calculator/src/data/models/dbo/course_parameters_dbo.dart';

abstract interface class CourseParametersLocalDataSource {
  Future<void> setCourseParameters(CourseParametersDbo courseParameters);

  Future<CourseParametersDbo> get courseParameters;
}

@Injectable(as: CourseParametersLocalDataSource)
class CourseParametersLocalDataSourceImpl implements CourseParametersLocalDataSource {
  const CourseParametersLocalDataSourceImpl(this._realm);

  final Realm _realm;

  @override
  Future<void> setCourseParameters(CourseParametersDbo courseParameters) async {
    await _realm.writeAsync(
      () => _realm
        ..deleteAll<CourseParametersDbo>()
        ..add(courseParameters),
    );
  }

  @override
  Future<CourseParametersDbo> get courseParameters async =>
      _realm.all<CourseParametersDbo>().nonNulls.first;
}
