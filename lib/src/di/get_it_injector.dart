import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:uboat_course_calculator/src/di/get_it_injector.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configurePresentationStorages() async => getIt.init();
