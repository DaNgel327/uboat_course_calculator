// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:realm/realm.dart' as _i3;
import 'package:uboat_course_calculator/src/data/data_sources/local/course_parameters_local_data_source.dart'
    as _i4;
import 'package:uboat_course_calculator/src/data/repositories/default_course_parameters_repository.dart'
    as _i6;
import 'package:uboat_course_calculator/src/di/storage_module.dart' as _i9;
import 'package:uboat_course_calculator/src/domain/repositories/course_parameters_repository.dart'
    as _i5;
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart'
    as _i7;
import 'package:uboat_course_calculator/src/presentation/ui/bottom_navigation_view/cubit/course_calculator_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    gh.singleton<_i3.Realm>(() => storageModule.realm);
    gh.factory<_i4.CourseParametersLocalDataSource>(
        () => _i4.CourseParametersLocalDataSourceImpl(gh<_i3.Realm>()));
    gh.factory<_i5.CourseParametersRepository>(() =>
        _i6.DefaultCourseParametersRepository(
            gh<_i4.CourseParametersLocalDataSource>()));
    gh.factory<_i7.CourseParametersCubit>(
        () => _i7.CourseParametersCubit(gh<_i5.CourseParametersRepository>()));
    gh.factory<_i8.CourseCalculatorCubit>(
        () => _i8.CourseCalculatorCubit(gh<_i5.CourseParametersRepository>()));
    return this;
  }
}

class _$StorageModule extends _i9.StorageModule {}
