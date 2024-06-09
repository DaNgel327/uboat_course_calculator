part of 'result.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({required Object error, StackTrace? stackTrace}) = _Failure;
}
