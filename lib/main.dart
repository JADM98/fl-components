import 'package:flutter/material.dart';

import 'package:fl_components/router/app_router.dart';
import 'package:fl_components/themes/app_themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //home: ListView2Screen());
        initialRoute: AppRouter.initialRoute,
        routes: AppRouter.getAppRoutes(),
        //initialRoute: 'home',
        //onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings)
        onGenerateRoute: AppRouter.onGenerateRoute, //Referencia a la función
        theme: AppThemes.lightTheme);
  }
}
