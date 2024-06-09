abstract class ParameterBlocData {
  ParameterBlocData(this.data);

  final double data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParameterBlocData &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class EventData extends ParameterBlocData {
  EventData(super.data);
}

class StateData extends ParameterBlocData {
  StateData(super.data);
}
