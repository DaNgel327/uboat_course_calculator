import 'dart:core';

enum Scope { scope0_6, scope1_5, scope6 }

class CourseParametersModel {
  const CourseParametersModel({
    required this.distance,
    required this.scope,
    required this.periscopeScaleValue,
    required this.boatLength,
  });

  factory CourseParametersModel.empty() => const CourseParametersModel(
        distance: 0,
        scope: Scope.scope0_6,
        periscopeScaleValue: 0,
        boatLength: 0,
      );

  final double distance;
  final Scope scope;
  final double periscopeScaleValue;
  final double boatLength;

  CourseParametersModel copyWith({
    double? distance,
    Scope? scope,
    double? periscopeScaleValue,
    double? boatLength,
  }) =>
      CourseParametersModel(
        distance: distance ?? this.distance,
        scope: scope ?? this.scope,
        periscopeScaleValue: periscopeScaleValue ?? this.periscopeScaleValue,
        boatLength: boatLength ?? this.boatLength,
      );

  @override
  String toString() {
    return 'CoordinateModel{'
        'distance: $distance, '
        'scope: $scope, '
        'periscopeScaleValue: $periscopeScaleValue '
        'boatLength: $boatLength}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseParametersModel &&
          runtimeType == other.runtimeType &&
          distance == other.distance &&
          scope == other.scope &&
          periscopeScaleValue == other.periscopeScaleValue &&
          boatLength == other.boatLength;

  @override
  int get hashCode =>
      distance.hashCode ^
      scope.hashCode ^
      periscopeScaleValue.hashCode ^
      boatLength.hashCode;
}

extension ScopeConverter on Scope {
  static Scope doubleToScope(double value) {
    if (value == 100) {
      return Scope.scope0_6;
    } else if (value == 300) {
      return Scope.scope1_5;
    } else if (value == 1100) {
      return Scope.scope6;
    }
    throw Exception('Undefined scope value');
  }

  double get scopeToDouble {
    switch (this) {
      case Scope.scope0_6:
        return 100;
      case Scope.scope1_5:
        return 300;
      case Scope.scope6:
        return 1100;
    }
  }

  double get scopeZoom {
    switch (this) {
      case Scope.scope0_6:
        return 0.6;
      case Scope.scope1_5:
        return 1.5;
      case Scope.scope6:
        return 6;
    }
  }
}
