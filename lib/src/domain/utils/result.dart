import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

part '_failure.dart';

class Result<T> {
  const Result._(this.value);

  factory Result.success(T value) => Result._(value);

  factory Result.failure({required Object error, StackTrace? stackTrace}) =>
      Result._(Failure(error: error, stackTrace: stackTrace));

  final Object? value;

  bool get isFailure => value is Failure;

  bool get isSuccess => !isFailure;

  FutureOr<R> fold<R>({
    required FutureOr<R> Function(T value) onSuccess,
    required FutureOr<R> Function(Object error, StackTrace? stackTrace) onFailure,
  }) =>
      switch (value) {
        final Failure failure => onFailure(failure.error, failure.stackTrace),
        _ => onSuccess(value as T),
      };

  T? getOrNull() {
    if (isFailure) return null;
    return value as T;
  }

  (Object error, StackTrace? stackTrace)? errorOrNull() {
    final value = this.value;
    if (value is Failure) return (value.error, value.stackTrace);
    return null;
  }

  Result<R> flatMap<R>(Result<R> Function(T value) block) {
    final value = this.value;
    if (value is Failure) return Result.failure(error: value.error, stackTrace: value.stackTrace);
    return block(value as T);
  }

  @override
  String toString() => switch (value) {
        final Failure failure => failure.toString(),
        _ => 'Success($value)',
      };
}

extension AsyncResult<T> on Future<Result<T>> {
  Future<Result<R>> flatMapAsync<R>(Future<Result<R>> Function(T value) block) async {
    final value = await then((value) => value.value);
    if (value is Failure) return Result.failure(error: value.error, stackTrace: value.stackTrace);
    return block(value as T);
  }
}
