class CalculatorBlocData {
  CalculatorBlocData(int course) : _course = course;

  factory CalculatorBlocData.zero() => CalculatorBlocData(0);

  final int _course;

  int get acuteCourse => _course;

  int get obtuseCourse => 180 - _course;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatorBlocData &&
          runtimeType == other.runtimeType &&
          _course == other._course;

  @override
  int get hashCode => _course.hashCode;
}
