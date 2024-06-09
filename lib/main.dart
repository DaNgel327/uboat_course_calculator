import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'src/bloc/course_calculator_bloc.dart';
import 'src/bloc/parameter_bloc.dart';
import 'src/tdc_home_screen.dart';
import 'src/themes/tdc_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const RootWidget()));
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DistanceParameterBloc>(
          create: (_) => DistanceParameterBloc(),
        ),
        ChangeNotifierProvider<ScopeParameterBloc>(
          create: (_) => ScopeParameterBloc(),
        ),
        ChangeNotifierProvider<ScaleParameterBloc>(
          create: (_) => ScaleParameterBloc(),
        ),
        ChangeNotifierProvider<BoatLengthParameterBloc>(
          create: (_) => BoatLengthParameterBloc(),
        ),
        ChangeNotifierProvider<CourseCalculatorBloc>(
          create: (_) => CourseCalculatorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Boat Course Calculator',
        theme: ThemeData(textTheme: TDCTheme.textTheme),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
              )),
          body: const SafeArea(
            top: false,
            bottom: false,
            child: TorpedoDataComputerHomeScreen(),
          ),
        ),
      ),
    );
  }
}
