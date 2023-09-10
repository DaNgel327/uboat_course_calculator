import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uboat_course_calculator/src/constants/string_constants.dart';
import 'package:uboat_course_calculator/src/models/course_parameters_model.dart';
import 'package:uboat_course_calculator/src/utils/picker_dialog.dart';

import '../bloc/model/parameter_bloc_data.dart';
import '../bloc/parameter_bloc.dart';
import '../models/course_parameters_list_data.dart';
import '../themes/tdc_theme.dart';

class CourseParametersListView extends StatefulWidget {
  const CourseParametersListView({
    required this.mainScreenAnimationController,
    required this.mainScreenAnimation,
    super.key,
  });

  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;

  @override
  State<CourseParametersListView> createState() =>
      _CourseParametersListViewState();
}

class _CourseParametersListViewState extends State<CourseParametersListView>
    with TickerProviderStateMixin {
  List<CourseParametersListData> courseParametersListData =
      CourseParametersListData.tabIconsList;

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
              0.0,
              30 * (1.0 - widget.mainScreenAnimation.value),
              0.0,
            ),
            child: SizedBox(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 16, left: 16),
                itemCount: courseParametersListData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final count = courseParametersListData.length > 10
                      ? 10
                      : courseParametersListData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval(
                        (1 / count) * index,
                        1.0,
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

  final CourseParametersListData courseParametersListData;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final bloc = switch (courseParametersListData.parameterType) {
      (ParameterType.distance) => context.watch<DistanceParameterBloc>(),
      (ParameterType.scope) => context.watch<ScopeParameterBloc>(),
      (ParameterType.scale) => context.watch<ScaleParameterBloc>(),
      (ParameterType.boatLength) => context.watch<BoatLengthParameterBloc>(),
    };

    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              100 * (1.0 - animation.value),
              0.0,
              0.0,
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
                    child: StreamBuilder<StateData>(
                        stream: bloc.stateStream,
                        builder: (context, snapshot) {
                          return GestureDetector(
                            onTap: () {
                              PickerDialog.showPickerDialog(
                                context: context,
                                pickerData: PickerData<num>(
                                  data: courseParametersListData.data,
                                  title: StringConstants.getPickerTitle(
                                    courseParametersListData.title,
                                  ),
                                  selectedTextStyle: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.teal,
                                    letterSpacing: 1.3,
                                  ),
                                  onConfirm: (picker, _) => bloc.addEvent(
                                    EventData(
                                      (picker.getSelectedValues().last as num)
                                          .toDouble(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: courseParametersListData.endColor
                                        .withOpacity(0.6),
                                    offset: const Offset(1.1, 4.0),
                                    blurRadius: 8.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    courseParametersListData.startColor,
                                    courseParametersListData.endColor
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(54.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 65,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                courseParametersListData
                                                    .subtitle
                                                    .join('\n'),
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
                                    snapshot.hasData &&
                                            snapshot.requireData.data != 0
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              _TextWithUnits(
                                                parameter:
                                                    courseParametersListData,
                                                snapshot: snapshot.requireData,
                                              ),
                                            ],
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              color: TDCTheme.nearlyWhite,
                                              shape: BoxShape.circle,
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: TDCTheme.nearlyBlack
                                                      .withOpacity(0.4),
                                                  offset:
                                                      const Offset(8.0, 8.0),
                                                  blurRadius: 8.0,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Icon(
                                                Icons.add,
                                                size: 24,
                                                color: courseParametersListData
                                                    .endColor,
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TextWithUnits extends StatelessWidget {
  const _TextWithUnits({
    required this.parameter,
    required this.snapshot,
  });

  final CourseParametersListData parameter;
  final StateData snapshot;

  @override
  Widget build(BuildContext context) {
    return Text(
      _getValueString(parameter, snapshot.data),
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

  String _getValueString(CourseParametersListData parameter, double data) {
    switch (parameter.parameterType) {
      case ParameterType.distance:
      case ParameterType.boatLength:
        return '${data % 1 != 0 ? data : data.round()} '
            '${StringConstants.metersUnit}';
      case ParameterType.scope:
        return '${StringConstants.scopeUnit}'
            '${ScopeConverter.doubleToScope(data).scopeZoom}';
      case ParameterType.scale:
        return data.toString();
    }
  }
}
