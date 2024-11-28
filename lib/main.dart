import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:townsquare/core/theme/ts_theme.dart';
import 'package:townsquare/dependency.dart';
import 'package:townsquare/firebase_options.dart';
import 'package:townsquare/presentation/bloc/bloc.dart';

import 'presentation/screen/screens.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          scrollbars: false,
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse, // Enable mouse drag for scrolling
          },
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 766, name: MOBILE),
            const Breakpoint(start: 767, end: 979, name: TABLET),
            const Breakpoint(start: 980, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'TownSquare',
        themeMode: ThemeMode.light,
        // darkTheme: TsTheme.getDarkTheme(),
        theme: TsTheme.getLightTheme(),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<AvailableActivityCubit>(),
            ),
            BlocProvider(
              create: (context) => TimelineDisplayCubit(),
            ),
          ],
          child: const MainScreen(),
        ),
      );
    });
  }
}
