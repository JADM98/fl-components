import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

  final List<String> games = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('List View 2'))),
        body: ListView.separated(
          itemCount: games.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(games[index]),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {
                  //String game = games[index];
                });
          },
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
