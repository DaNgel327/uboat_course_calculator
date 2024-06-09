import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';
import 'package:uboat_course_calculator/src/data/models/dbo/course_parameters_dbo.dart';

@module
abstract class StorageModule {
  @singleton
  Realm get realm => Realm(Configuration.local(schemaVersion: 1, [CourseParametersDbo.schema]));
}
