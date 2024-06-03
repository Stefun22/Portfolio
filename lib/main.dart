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
        title: 'Flutter Developer Portfolio',
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(titleTextStyle: TextStyle(color: Colors.white)),
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
              }),
          primarySwatch: Colors.green,
          // scaffoldBackgroundColor: Colors.lightGreen[200],
          scaffoldBackgroundColor: Colors.transparent,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
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

    return adjustedFontSize;
  }
}
