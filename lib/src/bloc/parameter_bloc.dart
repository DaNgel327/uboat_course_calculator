import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

import 'model/parameter_bloc_data.dart';

abstract class ParameterBloc with ChangeNotifier {
  Stream<StateData> get stateStream;

  StateData? get value;

  void addEvent(EventData event) => notifyListeners();

  @override
  void dispose();
}

class DistanceParameterBloc extends ParameterBloc {
  DistanceParameterBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  final _inputEventController = StreamController<EventData>();

  final _outputStateSubject = BehaviorSubject<StateData>();

  @override
  Stream<StateData> get stateStream => _outputStateSubject.stream;

  @override
  StateData? get value => _outputStateSubject.valueOrNull;

  @override
  void addEvent(EventData event) {
    _mapEventToState.call(event);
    super.addEvent(event);
  }

  void _mapEventToState(EventData event) =>
      _outputStateSubject.add(StateData(event.data));

  @override
  void dispose() {
    _inputEventController.close();
    _outputStateSubject.close();
    super.dispose();
  }
}

class ScopeParameterBloc extends ParameterBloc {
  ScopeParameterBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  final _inputEventController = StreamController<EventData>();

  final _outputStateSubject = BehaviorSubject<StateData>();

  @override
  Stream<StateData> get stateStream => _outputStateSubject.stream;

  @override
  StateData? get value => _outputStateSubject.valueOrNull;

  @override
  void addEvent(EventData event) {
    _mapEventToState.call(event);
    super.addEvent(event);
  }

  void _mapEventToState(EventData event) =>
      _outputStateSubject.add(StateData(event.data));

  @override
  void dispose() {
    _inputEventController.close();
    _outputStateSubject.close();
    super.dispose();
  }
}

class ScaleParameterBloc extends ParameterBloc {
  ScaleParameterBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  final _inputEventController = StreamController<EventData>();

  final _outputStateSubject = BehaviorSubject<StateData>();

  @override
  Stream<StateData> get stateStream => _outputStateSubject.stream;

  @override
  StateData? get value => _outputStateSubject.valueOrNull;

  @override
  void addEvent(EventData event) {
    _mapEventToState.call(event);
    super.addEvent(event);
  }

  void _mapEventToState(EventData event) =>
      _outputStateSubject.add(StateData(event.data));

  @override
  void dispose() {
    _inputEventController.close();
    _outputStateSubject.close();
    super.dispose();
  }
}

class BoatLengthParameterBloc extends ParameterBloc {
  BoatLengthParameterBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  final _inputEventController = StreamController<EventData>();

  final _outputStateSubject = BehaviorSubject<StateData>();

  @override
  Stream<StateData> get stateStream => _outputStateSubject.stream;

  @override
  StateData? get value => _outputStateSubject.valueOrNull;

  @override
  void addEvent(EventData event) {
    _mapEventToState.call(event);
    super.addEvent(event);
  }

  void _mapEventToState(EventData event) =>
      _outputStateSubject.add(StateData(event.data));

  @override
  void dispose() {
    _inputEventController.close();
    _outputStateSubject.close();
    super.dispose();
  }
}
