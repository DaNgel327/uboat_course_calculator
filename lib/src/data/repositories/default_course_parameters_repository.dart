import 'package:injectable/injectable.dart';
import 'package:uboat_course_calculator/src/data/data_sources/local/course_parameters_local_data_source.dart';
import 'package:uboat_course_calculator/src/data/mappers/course_parameters_mappers.dart';
import 'package:uboat_course_calculator/src/data/repositories/mixins/repository_mixin.dart';
import 'package:uboat_course_calculator/src/domain/entities/course_parameters.dart';
import 'package:uboat_course_calculator/src/domain/repositories/course_parameters_repository.dart';
import 'package:uboat_course_calculator/src/domain/utils/result.dart';

@Injectable(as: CourseParametersRepository)
class DefaultCourseParametersRepository with RepositoryMixin implements CourseParametersRepository {
  const DefaultCourseParametersRepository(this._localDataSource);

  final CourseParametersLocalDataSource _localDataSource;

  @override
  Future<Result<void>> setCourseParameters(CourseParameters courseParameters) async =>
      run(() => _localDataSource.setCourseParameters(courseParameters.toDbo()));

  @override
  Future<Result<CourseParameters>> get courseParameters =>
      run(() async => _localDataSource.courseParameters.then((value) => value.toModel()));
}
