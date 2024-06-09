import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uboat_course_calculator/src/constants/course_constants.dart';
import 'package:uboat_course_calculator/src/constants/string_constants.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/presentation/models/calculator_data.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';
import 'package:uboat_course_calculator/src/utils/course_formatter.dart';

class CourseDialogView extends StatelessWidget {
  const CourseDialogView({
    required this.animationController,
    required this.animation,
    super.key,
  });

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0,
              30 * (1.0 - animation.value),
              0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: 18,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: TDCTheme.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(68),
                  ),
                  gradient: const LinearGradient(
                    colors: <Color>[Colors.cyan, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: TDCTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              bottom: 8,
                              top: 16,
                            ),
                            child: Stack(
                              children: [
                                const Text(
                                  StringConstants.courseTabTitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: TDCTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: -0.1,
                                    color: TDCTheme.nearlyDarkBlue,
                                  ),
                                ),
                                Text(
                                  StringConstants.courseTabTitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: TDCTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: -0.1,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 0.5
                                      ..color = Colors.grey.shade100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocSelector<CourseParametersCubit, CourseParametersState,
                              CalculatorData?>(
                            selector: (state) => state.course,
                            builder: (context, course) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4, bottom: 3),
                                        child: _TextWithValue(
                                          data: course ?? CalculatorData.zero(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: TDCTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TextWithValue extends StatelessWidget {
  const _TextWithValue({required this.data});

  final CalculatorData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          '${data.acuteCourse}${CourseConstants.degreeSymbol}'
          '/'
          '${data.obtuseCourse}${CourseConstants.degreeSymbol}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: TDCTheme.fontName,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: TDCTheme.nearlyDarkBlue,
          ),
        ),
        Text(
          CourseFormatter.getCourse(data.acuteCourse, data.obtuseCourse),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: TDCTheme.fontName,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.grey.shade100,
          ),
        ),
      ],
    );
  }
}
