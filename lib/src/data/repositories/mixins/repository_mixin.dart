import 'package:logger/logger.dart';
import 'package:uboat_course_calculator/src/domain/utils/result.dart';

mixin RepositoryMixin {
  Future<Result<T>> run<T>(Future<T> Function() job) async {
    try {
      return Result.success(await job());
    } catch (error, stackTrace) {
      Logger().e(error.toString(), error: error, stackTrace: stackTrace);
      return Result.failure(error: error, stackTrace: stackTrace);
    }
  }
}
