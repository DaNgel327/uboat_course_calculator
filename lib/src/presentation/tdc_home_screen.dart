import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/presentation/tdc/torpedo_data_computer_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Torpedo Data Computer Calculator'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.cyan, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: tabBody,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocSelector<CourseParametersCubit, CourseParametersState, bool>(
        selector: (state) => state.isAllFilled,
        builder: (context, isReady) {
          return Container(
            decoration: BoxDecoration(
              color: isReady ? TDCTheme.nearlyDarkBlue : Colors.black,
              gradient: isReady
                  ? const LinearGradient(
                      colors: <Color>[Colors.cyan, Colors.teal],
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
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                    size: 50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
