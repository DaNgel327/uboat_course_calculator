import 'package:flutter/material.dart';
import 'package:uboat_course_calculator/src/constants/string_constants.dart';
import 'package:uboat_course_calculator/src/presentation/ui/course_dialog.dart';
import 'package:uboat_course_calculator/src/presentation/ui/course_parameters_list_view.dart';
import 'package:uboat_course_calculator/src/presentation/ui/recommendation_dialog.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

class TorpedoDataComputerScreen extends StatefulWidget {
  const TorpedoDataComputerScreen({
    required this.animationController,
    super.key,
  });

  final AnimationController animationController;

  @override
  State<TorpedoDataComputerScreen> createState() => _TorpedoDataComputerScreenState();
}

class _TorpedoDataComputerScreenState extends State<TorpedoDataComputerScreen>
    with TickerProviderStateMixin {
  List<Widget> listViews = <Widget>[];
  double topBarOpacity = 0;

  late final ScrollController scrollController;
  late final Animation<double> topBarAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    topBarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
    addAllListData();
    scrollController.addListener(() {
      if (scrollController.offset >= 24 && topBarOpacity != 1.0 && mounted) {
        setState(() => topBarOpacity = 1.0);
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0 &&
          topBarOpacity != scrollController.offset / 24 &&
          mounted) {
        setState(() => topBarOpacity = scrollController.offset / 24);
      } else if (scrollController.offset <= 0 && topBarOpacity != 0.0 && mounted) {
        setState(() => topBarOpacity = 0.0);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addAllListData() => listViews.addAll([
        CourseParametersListView(
          mainScreenAnimationController: widget.animationController,
          mainScreenAnimation: getAnimation(3),
        ),
        CourseDialogView(
          animationController: widget.animationController,
          animation: getAnimation(5),
        ),
        RecommendationDialog(
          animationController: widget.animationController,
          animation: getAnimation(8),
        ),
      ]);

  Animation<double> getAnimation(int intervalFactor) {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          (1 / 9) * intervalFactor,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TDCTheme.background,
      child: Stack(
        children: <Widget>[
          _AppBarWidget(
            animationController: widget.animationController,
            scrollController: scrollController,
            topBarAnimation: topBarAnimation,
            topBarOpacity: topBarOpacity,
          ),
          _BodyWidgetsListView(
            animationController: widget.animationController,
            scrollController: scrollController,
            data: listViews,
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

class _BodyWidgetsListView extends StatelessWidget {
  const _BodyWidgetsListView({
    required this.scrollController,
    required this.animationController,
    required this.data,
  });

  final ScrollController scrollController;
  final AnimationController animationController;
  final List<Widget> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: builderData,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => !snapshot.hasData
          ? const SizedBox()
          : ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.only(
                bottom: 62 + MediaQuery.of(context).padding.bottom,
                top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 14,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                animationController.forward();
                return data.elementAt(index);
              },
            ),
    );
  }

  Future<bool> get builderData =>
      Future.delayed(const Duration(milliseconds: 50)).then((_) => true);
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({
    required this.animationController,
    required this.scrollController,
    required this.topBarAnimation,
    required this.topBarOpacity,
  });

  final AnimationController animationController;
  final ScrollController scrollController;
  final Animation<double> topBarAnimation;
  final double topBarOpacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                  0,
                  30 * (1.0 - topBarAnimation.value),
                  0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: TDCTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: TDCTheme.grey.withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16 - 8.0 * topBarOpacity,
                          bottom: 12 - 8.0 * topBarOpacity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  StringConstants.tabsTitle,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: TDCTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: TDCTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
