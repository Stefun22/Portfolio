import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/project_bloc.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Sizes.height = MediaQuery.of(context).size.height;
    Sizes.width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProjectBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'J A B A S E E L A N',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white.withOpacity(0.8))),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white.withOpacity(0.8),
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(1, 1),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.windows: OpenUpwardsPageTransitionsBuilder(),
            },
          ),
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.black,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          '/about': (context) => AboutScreen(),
          '/projects': (context) => ProjectsScreen(),
          '/contact': (context) => ContactScreen(),
        },
      ),
    );
  }
}

class Sizes {
  static double width = 0.0;
  static double height = 0.0;
}

extension DoubleExtension on int {
  double adjust() {
    final screenWidth =
        MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    double interpolate(double x, double yMin) {
      return (x / 1253.0) * this;
    }

    double adjustedFontSize = interpolate(screenWidth, toDouble());

    // return adjustedFontSize;
    return toDouble();
  }
}
