import 'dart:async';
import 'dart:math';

import 'package:uboat_course_calculator/src/bloc/model/calculator_bloc_data.dart';
import 'package:uboat_course_calculator/src/bloc/model/parameter_bloc_data.dart';
import 'package:uboat_course_calculator/src/bloc/parameter_bloc.dart';
import 'package:uboat_course_calculator/src/models/course_parameters_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class CourseCalculatorBloc with ChangeNotifier {
  CourseCalculatorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  final _inputEventController = StreamController<CourseParametersModel>();

  final _outputStateSubject = BehaviorSubject<CalculatorBlocData>();

  void addEvent(CourseParametersModel model) =>
      _inputEventController.sink.add(model);

  Stream<CalculatorBlocData> get stateStream => _outputStateSubject.stream;

  CalculatorBlocData get value => _outputStateSubject.value;

  void _mapEventToState(CourseParametersModel model) {
    _outputStateSubject.add(CalculatorBlocData(_calculateCourse(model)));
    notifyListeners();
  }

  int _calculateCourse(CourseParametersModel model) => (asin(model.distance /
              model.scope.scopeToDouble *
              model.periscopeScaleValue /
              model.boatLength) *
          (180 / pi))
      .round();

  Stream<bool> isReadyToCalculateStream(BuildContext context) =>
      Rx.combineLatest4<StateData, StateData, StateData, StateData, bool>(
        context.read<DistanceParameterBloc>().stateStream,
        context.read<ScopeParameterBloc>().stateStream,
        context.read<ScaleParameterBloc>().stateStream,
        context.read<BoatLengthParameterBloc>().stateStream,
        (distance, scope, scale, boatLength) =>
            distance.data != 0 ||
            scope.data != 0 ||
            scale.data != 0 ||
            boatLength.data != 0,
      );

  @override
  void dispose() {
    _inputEventController.close();
    _outputStateSubject.close();
    super.dispose();
  }
}
