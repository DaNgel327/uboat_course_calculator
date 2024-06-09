// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_parameters_dbo.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CourseParametersDbo extends _CourseParametersDbo
    with RealmEntity, RealmObjectBase, RealmObject {
  CourseParametersDbo(
    double distance,
    double scope,
    double periscopeScaleValue,
    double boatLength,
  ) {
    RealmObjectBase.set(this, 'distance', distance);
    RealmObjectBase.set(this, 'scope', scope);
    RealmObjectBase.set(this, 'periscopeScaleValue', periscopeScaleValue);
    RealmObjectBase.set(this, 'boatLength', boatLength);
  }

  CourseParametersDbo._();

  @override
  double get distance =>
      RealmObjectBase.get<double>(this, 'distance') as double;
  @override
  set distance(double value) => RealmObjectBase.set(this, 'distance', value);

  @override
  double get scope => RealmObjectBase.get<double>(this, 'scope') as double;
  @override
  set scope(double value) => RealmObjectBase.set(this, 'scope', value);

  @override
  double get periscopeScaleValue =>
      RealmObjectBase.get<double>(this, 'periscopeScaleValue') as double;
  @override
  set periscopeScaleValue(double value) =>
      RealmObjectBase.set(this, 'periscopeScaleValue', value);

  @override
  double get boatLength =>
      RealmObjectBase.get<double>(this, 'boatLength') as double;
  @override
  set boatLength(double value) =>
      RealmObjectBase.set(this, 'boatLength', value);

  @override
  Stream<RealmObjectChanges<CourseParametersDbo>> get changes =>
      RealmObjectBase.getChanges<CourseParametersDbo>(this);

  @override
  Stream<RealmObjectChanges<CourseParametersDbo>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CourseParametersDbo>(this, keyPaths);

  @override
  CourseParametersDbo freeze() =>
      RealmObjectBase.freezeObject<CourseParametersDbo>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'distance': distance.toEJson(),
      'scope': scope.toEJson(),
      'periscopeScaleValue': periscopeScaleValue.toEJson(),
      'boatLength': boatLength.toEJson(),
    };
  }

  static EJsonValue _toEJson(CourseParametersDbo value) => value.toEJson();
  static CourseParametersDbo _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'distance': EJsonValue distance,
        'scope': EJsonValue scope,
        'periscopeScaleValue': EJsonValue periscopeScaleValue,
        'boatLength': EJsonValue boatLength,
      } =>
        CourseParametersDbo(
          fromEJson(distance),
          fromEJson(scope),
          fromEJson(periscopeScaleValue),
          fromEJson(boatLength),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CourseParametersDbo._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, CourseParametersDbo, 'CourseParametersDbo', [
      SchemaProperty('distance', RealmPropertyType.double),
      SchemaProperty('scope', RealmPropertyType.double),
      SchemaProperty('periscopeScaleValue', RealmPropertyType.double),
      SchemaProperty('boatLength', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
