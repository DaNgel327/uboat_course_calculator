import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:uboat_course_calculator/src/constants/asset_path_constants.dart';
import 'package:uboat_course_calculator/src/constants/string_constants.dart';
import 'package:uboat_course_calculator/src/domain/entities/course_parameters_data.dart';
import 'package:uboat_course_calculator/src/domain/enums/parameter_type.dart';
import 'package:uboat_course_calculator/src/domain/enums/scope.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';
import 'package:uboat_course_calculator/src/utils/picker_dialog.dart';

class CourseParametersListView extends StatefulWidget {
  const CourseParametersListView({
    required this.mainScreenAnimationController,
    required this.mainScreenAnimation,
    super.key,
  });

  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;

  @override
  State<CourseParametersListView> createState() => _CourseParametersListViewState();
}

class _CourseParametersListViewState extends State<CourseParametersListView>
    with TickerProviderStateMixin {
  final List<CourseParametersData> courseParametersListData = <CourseParametersData>[
    CourseParametersData(
      parameterType: ParameterType.distance,
      imagePath: AssetPathConstants.distanceImage,
      title: StringConstants.distanceTitle,
      subtitle: StringConstants.distanceSubtitle,
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
    CourseParametersData(
      parameterType: ParameterType.scope,
      imagePath: AssetPathConstants.scopeImage,
      title: StringConstants.scopeTitle,
      subtitle: StringConstants.scopeSubtitle,
      startColor: TDCTheme.scopeTabGradientStartColor,
      endColor: TDCTheme.scopeTabGradientEndColor,
      units: StringConstants.scopeUnit,
      data: Scope.values
          .map(
            (scope) => PickerItem<int>(
              value: scope.value.round(),
              text: Center(child: Text(scope.value.round().toString())),
            ),
          )
          .toList(),
    ),
    CourseParametersData(
      parameterType: ParameterType.scale,
      imagePath: AssetPathConstants.scaleImage,
      title: StringConstants.scaleTitle,
      subtitle: StringConstants.scaleSubtitle,
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
    CourseParametersData(
      parameterType: ParameterType.boatLength,
      imagePath: AssetPathConstants.boatImage,
      title: StringConstants.boatLengthTitle,
      subtitle: StringConstants.boatLengthSubtitle,
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

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
              0,
              30 * (1.0 - widget.mainScreenAnimation.value),
              0,
            ),
            child: SizedBox(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 16, left: 16),
                itemCount: courseParametersListData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final count =
                      courseParametersListData.length > 10 ? 10 : courseParametersListData.length;
                  final animation = Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval(
                        (1 / count) * index,
                        1,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  );
                  animationController.forward();

                  return _ParametersView(
                    animationController: animationController,
                    animation: animation,
                    courseParametersListData: courseParametersListData[index],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ParametersView extends StatelessWidget {
  const _ParametersView({
    required this.courseParametersListData,
    required this.animationController,
    required this.animation,
  });

  final CourseParametersData courseParametersListData;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final cubit = context.read<CourseParametersCubit>();
        return AnimatedBuilder(
          animation: animationController,
          builder: (_, __) {
            return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(
                  100 * (1.0 - animation.value),
                  0,
                  0,
                ),
                child: SizedBox(
                  width: 130,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 8,
                          right: 8,
                          bottom: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            PickerDialog.showPickerDialog(
                              context: context,
                              pickerData: PickerData(
                                data: courseParametersListData.data,
                                title: StringConstants.getPickerTitle(
                                  courseParametersListData.title,
                                ),
                                selectedTextStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.teal,
                                  letterSpacing: 1.3,
                                ),
                                onConfirm: (picker, _) =>
                                    switch (courseParametersListData.parameterType) {
                                  ParameterType.distance => cubit.setDistance(
                                      picker.getSelectedValues().last as num,
                                    ),
                                  ParameterType.scope => cubit.setScope(
                                      Scope.fromValue(
                                        picker.getSelectedValues().last as num,
                                      ),
                                    ),
                                  ParameterType.scale => cubit.setPeriscopeScaleValue(
                                      picker.getSelectedValues().last as num,
                                    ),
                                  ParameterType.boatLength =>
                                    cubit.setBoatLength(picker.getSelectedValues().last as num),
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: courseParametersListData.endColor.withOpacity(0.6),
                                  offset: const Offset(1.1, 4),
                                  blurRadius: 8,
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: <Color>[
                                  courseParametersListData.startColor,
                                  courseParametersListData.endColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(54),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 65,
                                left: 10,
                                right: 10,
                              ),
                              child: BlocBuilder<CourseParametersCubit, CourseParametersState>(
                                builder: (context, state) {
                                  final type = courseParametersListData.parameterType;
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          courseParametersListData.title,
                                          softWrap: true,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontFamily: TDCTheme.fontName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.2,
                                            color: TDCTheme.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  courseParametersListData.subtitle,
                                                  maxLines: 3,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                    fontFamily: TDCTheme.fontName,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    letterSpacing: 0.2,
                                                    color: TDCTheme.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (state.isFilledByParameterType(type))
                                        Row(
                                          children: <Widget>[
                                            _TextWithUnits(
                                              parameter: courseParametersListData,
                                              data: state.getParameterByType(type)!,
                                            ),
                                          ],
                                        )
                                      else
                                        Container(
                                          decoration: BoxDecoration(
                                            color: TDCTheme.nearlyWhite,
                                            shape: BoxShape.circle,
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: TDCTheme.nearlyBlack.withOpacity(0.4),
                                                offset: const Offset(8, 8),
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                              color: courseParametersListData.endColor,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            color: TDCTheme.nearlyWhite.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset(courseParametersListData.imagePath),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TextWithUnits extends StatelessWidget {
  const _TextWithUnits({
    required this.parameter,
    required this.data,
  });

  final CourseParametersData parameter;
  final num data;

  @override
  Widget build(BuildContext context) {
    return Text(
      _getValueString(parameter, data),
      textAlign: TextAlign.center,
      maxLines: 1,
      style: const TextStyle(
        fontFamily: TDCTheme.fontName,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        letterSpacing: 0.2,
        color: TDCTheme.white,
      ),
    );
  }

  String _getValueString(CourseParametersData parameter, num data) {
    switch (parameter.parameterType) {
      case ParameterType.distance:
      case ParameterType.boatLength:
        return '${data % 1 != 0 ? data : data.round()} '
            '${StringConstants.metersUnit}';
      case ParameterType.scope:
        return '${StringConstants.scopeUnit}'
            '${Scope.fromValue(data).zoom}';
      case ParameterType.scale:
        return data.toString();
    }
  }
}
