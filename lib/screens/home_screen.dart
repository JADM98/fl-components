import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

import 'package:fl_components/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('Flutter components')),
            elevation: 10),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(AppRouter.menuOptions[index].name),
                leading: Icon(AppRouter.menuOptions[index].icon,
                    color: AppThemes.primary),
                onTap: () {
                  // MaterialPageRoute route = MaterialPageRoute(
                  //   builder: (context) => const AlertScreen(),
                  // );

                  //Navigator.push(context, route);
                  //Navigator.pushReplacement(context, route);
                  Navigator.pushNamed(
                      context, AppRouter.menuOptions[index].route);
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRouter.numberOfOptions));
  }
}
