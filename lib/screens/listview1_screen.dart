import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

  final List<String> games = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('List View 1')),
        ),
        body: ListView(
          children: [
            ...games
                .map((game) => ListTile(
                    title: Text(game),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    )))
                .toList()
          ],
        ));
  }
}
