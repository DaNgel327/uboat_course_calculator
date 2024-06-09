import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uboat_course_calculator/src/di/get_it_injector.dart';
import 'package:uboat_course_calculator/src/presentation/cubits/course_parameters_cubit.dart';
import 'package:uboat_course_calculator/src/presentation/tdc_home_screen.dart';
import 'package:uboat_course_calculator/src/themes/tdc_theme.dart';

Future<void> main() async {
  await configurePresentationStorages();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) => runApp(const RootWidget()));
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider<CourseParametersCubit>(
      create: (_) => getIt(),
      child: MaterialApp(
        title: 'Boat Course Calculator',
        theme: ThemeData(textTheme: TDCTheme.textTheme),
        debugShowCheckedModeBanner: false,
        home: const TorpedoDataComputerHomeScreen(),
      ),
    );
  }
}
