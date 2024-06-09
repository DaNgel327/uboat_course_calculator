import 'package:uboat_course_calculator/src/models/course_parameters_model.dart';
import 'package:rxdart/rxdart.dart';

class CourseParameterStorage {
  static final CourseParameterStorage instance =
      CourseParameterStorage._internal(CourseParametersModel.empty());

  factory CourseParameterStorage() => instance;

  CourseParameterStorage._internal(CourseParametersModel initModel)
      : _modelSubject = BehaviorSubject.seeded(initModel);

  final BehaviorSubject<CourseParametersModel> _modelSubject;

  CourseParametersModel get model => _modelSubject.value;

  void updateModel(CourseParametersModel newModel) =>
      _modelSubject.add(newModel);
}
