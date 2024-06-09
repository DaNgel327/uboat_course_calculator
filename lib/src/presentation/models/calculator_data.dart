import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_data.freezed.dart';

@freezed
class CalculatorData with _$CalculatorData {
  const factory CalculatorData({required int course}) = _CalculatorData;
  factory CalculatorData.zero() => const _CalculatorData(course: 0);

  const CalculatorData._();

  int get acuteCourse => course;

  int get obtuseCourse => 180 - course;
}
