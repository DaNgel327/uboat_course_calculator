import 'package:uboat_course_calculator/src/bloc/parameter_bloc.dart';
import 'package:uboat_course_calculator/src/models/course_parameters_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/course_calculator_bloc.dart';
import 'models/tab_icon_data.dart';
import 'tdc/torpedo_data_computer_screen.dart';
import 'themes/tdc_theme.dart';
import 'ui/bottom_navigation_view/bottom_bar_view.dart';

class TorpedoDataComputerHomeScreen extends StatefulWidget {
  const TorpedoDataComputerHomeScreen({super.key});

  @override
  State<TorpedoDataComputerHomeScreen> createState() =>
      _TorpedoDataComputerHomeScreenState();
}

class _TorpedoDataComputerHomeScreenState
    extends State<TorpedoDataComputerHomeScreen> with TickerProviderStateMixin {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(color: TDCTheme.background);

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    for (final TabIconData tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;
    tabBody = TorpedoDataComputerScreen(
      animationController: animationController,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
            !snapshot.hasData
                ? const SizedBox()
                : Stack(children: <Widget>[tabBody, bottomBar()]),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(child: SizedBox()),
        BottomBarView(
          tabIconsList: tabIconsList,
          onCalculatePressed: _getCalculatePressedHandler,
          changeIndex: (_) {},
        ),
      ],
    );
  }

  void _getCalculatePressedHandler() {
    final distance = context.read<DistanceParameterBloc>().value?.data;
    final scope = context.read<ScopeParameterBloc>().value?.data;
    final scale = context.read<ScaleParameterBloc>().value?.data;
    final boatLength = context.read<BoatLengthParameterBloc>().value?.data;

    if (distance == null ||
        scope == null ||
        scale == null ||
        boatLength == null) {
      return;
    }

    final calculateBloc = context.read<CourseCalculatorBloc>();
    final CourseParametersModel model = CourseParametersModel(
      distance: distance,
      scope: ScopeConverter.doubleToScope(scope),
      periscopeScaleValue: scale,
      boatLength: boatLength,
    );

    return calculateBloc.addEvent(model);
  }
}
