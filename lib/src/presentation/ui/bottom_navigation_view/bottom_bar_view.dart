import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final cubit = context.read<CourseParametersCubit>();
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            AnimatedBuilder(
              animation: animationController,
              builder: (context, _) {
                return Transform(
                  transform: Matrix4.translationValues(0, 0, 0),
                  child: PhysicalShape(
                    color: TDCTheme.white,
                    elevation: 16,
                    clipper: TabClipper(
                      radius: 38.0 *
                          Tween<double>(begin: 0, end: 1)
                              .animate(
                                CurvedAnimation(
                                  parent: animationController,
                                  curve: Curves.fastOutSlowIn,
                                ),
                              )
                              .value,
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 62,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 4,
                            ),
                            child: SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 + 62.0,
                child: Container(
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  child: SizedBox(
                    width: 38 * 2.0,
                    height: 38 * 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: animationController,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        child: BlocSelector<CourseParametersCubit, CourseParametersState, bool>(
                          selector: (state) => state.isAllFilled,
                          builder: (context, isReady) {
                            return Container(
                              decoration: BoxDecoration(
                                color: isReady ? TDCTheme.nearlyDarkBlue : Colors.black,
                                gradient: isReady
                                    ? const LinearGradient(
                                        colors: <Color>[
                                          Colors.cyan,
                                          Colors.teal,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                shape: BoxShape.circle,
                                boxShadow: isReady
                                    ? <BoxShadow>[
                                        const BoxShadow(
                                          color: TDCTheme.nearlyDarkBlue,
                                          blurRadius: 15,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white.withOpacity(0.1),
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  onTap: isReady ? cubit.onCalculatePressed : null,
                                  child: const Icon(
                                    Icons.calculate_outlined,
                                    color: TDCTheme.nearlyWhite,
                                    size: 32,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final path = Path();

    final v = radius * 2;
    path
      ..lineTo(0, 0)
      ..arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180), degreeToRadians(90), false)
      ..arcTo(
        Rect.fromLTWH(((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false,
      )
      ..arcTo(
        Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160),
        degreeToRadians(-140),
        false,
      )
      ..arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0, radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false,
      )
      ..arcTo(
        Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(90),
        false,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final radian = (math.pi / 180) * degree;
    return radian;
  }
}
