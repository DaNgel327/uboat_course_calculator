import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/presentation/tdc/torpedo_data_computer_screen.dart';
import 'package:uboat_course_calculator/src/presentation/ui/bottom_navigation_view/bottom_bar_view.dart';
import 'package:uboat_course_calculator/src/presentation/ui/bottom_navigation_view/cubit/course_calculator_cubit.dart';
import 'package:uboat_course_calculator/src/presentation/ui/bottom_navigation_view/cubit/course_calculator_event.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

class TorpedoDataComputerHomeScreen extends StatefulWidget {
  const TorpedoDataComputerHomeScreen({super.key});

  @override
  State<TorpedoDataComputerHomeScreen> createState() => _TorpedoDataComputerHomeScreenState();
}

class _TorpedoDataComputerHomeScreenState extends State<TorpedoDataComputerHomeScreen>
    with TickerProviderStateMixin {
  Widget tabBody = Container(color: TDCTheme.background);

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    tabBody = TorpedoDataComputerScreen(animationController: animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseParametersCubit>();
    return BlocPresentationListener<CourseCalculatorCubit, CourseCalculatorEvent>(
      listener: (context, state) {
        if (state is CalculateEvent) cubit.calculateCourse(state.parameters);
      },
      child: Material(
        color: Colors.transparent,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => !snapshot.hasData
              ? const SizedBox()
              : Stack(children: <Widget>[tabBody, bottomBar()]),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return const Column(children: <Widget>[Expanded(child: SizedBox()), BottomBarView()]);
  }
}
