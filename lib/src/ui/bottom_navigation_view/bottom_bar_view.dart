import 'dart:math' as math;

import 'package:uboat_course_calculator/src/bloc/course_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tab_icon_data.dart';
import '../../themes/tdc_theme.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({
    required this.tabIconsList,
    required this.changeIndex,
    required this.onCalculatePressed,
    super.key,
  });

  final List<TabIconData> tabIconsList;
  final Function(int index) changeIndex;
  final void Function()? onCalculatePressed;

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
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
    final bloc = Provider.of<CourseCalculatorBloc>(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: TDCTheme.white,
                elevation: 16.0,
                clipper: TabClipper(
                  radius: 38.0 *
                      Tween<double>(begin: 0.0, end: 1.0)
                          .animate(CurvedAnimation(
                            parent: animationController,
                            curve: Curves.fastOutSlowIn,
                          ))
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
                        child: Row(children: []),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom)
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
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                      parent: animationController,
                      curve: Curves.fastOutSlowIn,
                    )),
                    child: StreamBuilder<bool>(
                        stream: bloc.isReadyToCalculateStream(context),
                        initialData: false,
                        builder: (context, snapshot) {
                          return Container(
                            decoration: BoxDecoration(
                              color: snapshot.requireData
                                  ? TDCTheme.nearlyDarkBlue
                                  : Colors.black,
                              gradient: snapshot.requireData
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
                              boxShadow: snapshot.requireData
                                  ? <BoxShadow>[
                                      const BoxShadow(
                                        color: TDCTheme.nearlyDarkBlue,
                                        blurRadius: 15.0,
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
                                onTap: snapshot.requireData
                                    ? widget.onCalculatePressed
                                    : null,
                                child: const Icon(
                                  Icons.calculate_outlined,
                                  color: TDCTheme.nearlyWhite,
                                  size: 32,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    if (mounted) {
      setState(() {
        for (final TabIconData tab in widget.tabIconsList) {
          tab.isSelected = false;
          if (tabIconData.index == tab.index) {
            tab.isSelected = true;
          }
        }
      });
    }
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({
    required this.tabIconData,
    required this.removeAllSelect,
    super.key,
  });

  final TabIconData tabIconData;
  final Function() removeAllSelect;

  @override
  State<TabIcons> createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect();
          animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: const Interval(0.1, 1.0,
                              curve: Curves.fastOutSlowIn))),
                  child: Image.asset(widget.tabIconData.isSelected
                      ? widget.tabIconData.selectedImagePath
                      : widget.tabIconData.imagePath),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: const Interval(
                          0.2,
                          1.0,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: TDCTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController,
                            curve: const Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: TDCTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController,
                            curve: const Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: TDCTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
