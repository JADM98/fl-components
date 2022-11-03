import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRouter {
  static String initialRoute = 'home';
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'home': (BuildContext context) => const HomeScreen(),
  // };
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final options in menuOptions) {
      appRoutes
          .addAll({options.route: (BuildContext context) => options.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }

  static final List<MenuOptions> menuOptions = [
    // MenuOptions(
    //     route: 'home',
    //     name: 'Home screen',
    //     icon: Icons.home,
    //     screen: const HomeScreen()),
    MenuOptions(
        route: 'alert',
        name: 'Alert screen',
        icon: Icons.add_alert_outlined,
        screen: const AlertScreen()),
    MenuOptions(
        route: 'card',
        name: 'Card screen',
        icon: Icons.credit_card,
        screen: const CardScreen()),
    MenuOptions(
        route: 'listview1',
        name: 'List View 1',
        icon: Icons.list,
        screen: const ListView1Screen()),
    MenuOptions(
        route: 'listview2',
        name: 'List View 2',
        icon: Icons.list,
        screen: const ListView2Screen()),
    MenuOptions(
        route: 'avatar',
        name: 'Avatar Screen',
        icon: Icons.person,
        screen: const AvatarScreen()),
    MenuOptions(
        route: 'animated',
        name: 'Animated Screen',
        icon: Icons.play_circle_outline_outlined,
        screen: const AnimatedScreen()),
    MenuOptions(
        route: 'input',
        name: 'Text inputs',
        icon: Icons.input_rounded,
        screen: const InputScreen()),
    MenuOptions(
        route: 'slider',
        name: 'Slider & Checks',
        icon: Icons.published_with_changes_outlined,
        screen: const SliderScreen()),
    MenuOptions(
        route: 'listviewbuilder',
        name: 'List View Builder',
        icon: Icons.list_alt_outlined,
        screen: const ListViewBuilderScreen())
  ];

  static int get numberOfOptions {
    return menuOptions.length;
  }
}
