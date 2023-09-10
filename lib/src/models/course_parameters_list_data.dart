import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../constants/asset_path_constants.dart';
import '../constants/string_constants.dart';
import '../themes/tdc_theme.dart';
import 'course_parameters_model.dart';

enum ParameterType { distance, scope, scale, boatLength }

class CourseParametersListData {
  const CourseParametersListData({
    required this.subtitle,
    required this.parameterType,
    required this.data,
    this.imagePath = StringConstants.emptyString,
    this.title = StringConstants.emptyString,
    this.startColor = TDCTheme.grey,
    this.endColor = TDCTheme.grey,
    this.initValue = 0,
    this.units = StringConstants.emptyString,
  });

  final ParameterType parameterType;
  final String imagePath;
  final String title;
  final Color startColor;
  final Color endColor;
  final List<String> subtitle;
  final double initValue;
  final String units;
  final List<PickerItem<num>> data;

  static List<CourseParametersListData> tabIconsList =
      <CourseParametersListData>[
    CourseParametersListData(
      parameterType: ParameterType.distance,
      imagePath: AssetPathConstants.distanceImage,
      title: StringConstants.distanceTitle,
      initValue: 0,
      subtitle: <String>[StringConstants.distanceSubtitle],
      startColor: TDCTheme.distanceTabGradientStartColor,
      endColor: TDCTheme.distanceTabGradientEndColor,
      units: StringConstants.metersUnit,
      data: [
        for (int i = 100; i <= 10000; i += 100)
          PickerItem<int>(
            value: i,
            text: Center(child: Text(i.toString())),
          ),
      ],
    ),
    CourseParametersListData(
      parameterType: ParameterType.scope,
      imagePath: AssetPathConstants.scopeImage,
      title: StringConstants.scopeTitle,
      initValue: 0,
      subtitle: <String>[StringConstants.scopeSubtitle],
      startColor: TDCTheme.scopeTabGradientStartColor,
      endColor: TDCTheme.scopeTabGradientEndColor,
      units: StringConstants.scopeUnit,
      data: Scope.values
          .map(
            (scope) => PickerItem<int>(
              value: scope.scopeToDouble.round(),
              text: Center(child: Text(scope.scopeToDouble.round().toString())),
            ),
          )
          .toList(),
    ),
    CourseParametersListData(
      parameterType: ParameterType.scale,
      imagePath: AssetPathConstants.scaleImage,
      title: StringConstants.scaleTitle,
      initValue: 0,
      subtitle: <String>[StringConstants.scaleSubtitle],
      startColor: TDCTheme.scaleTabGradientStartColor,
      endColor: TDCTheme.scaleTabGradientEndColor,
      data: [
        for (double i = 0.5; i <= 36; i += 0.5)
          PickerItem<double>(
            value: i,
            text: Center(child: Text(i.toString())),
          ),
      ],
    ),
    CourseParametersListData(
      parameterType: ParameterType.boatLength,
      imagePath: AssetPathConstants.boatImage,
      title: StringConstants.boatLengthTitle,
      initValue: 0,
      subtitle: <String>[StringConstants.boatLengthSubtitle],
      startColor: TDCTheme.boatLengthTabGradientStartColor,
      endColor: TDCTheme.boatLengthTabGradientEndColor,
      units: StringConstants.metersUnit,
      data: [
        for (int i = 50; i <= 300; i++)
          PickerItem<int>(
            value: i,
            text: Center(child: Text(i.toString())),
          ),
      ],
    ),
  ];
}
