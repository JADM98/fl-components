import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCard1(),
            SizedBox(height: 10),
            CustomCard2(
                imageURL:
                    'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg'),
            SizedBox(height: 10),
            CustomCard2(
              imageURL:
                  'https://www.isolatedtraveller.com/wp-content/uploads/2021/05/What-is-the-capital-city-of-France-1.png',
              name: 'Francia',
            ),
            SizedBox(height: 10),
            CustomCard2(
              imageURL:
                  'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F968162396%2F0x0.jpg',
              name: 'Japón',
            ),
            SizedBox(height: 10),
            CustomCard2(
              imageURL:
                  'https://i.natgeofe.com/n/6c02ad5a-977b-4f12-b9c0-02ffb0736e07/metropolitan-cathedral-zocalo-mexico-city_2x1.JPG',
              name: 'México',
            )
          ],
        ));
  }
}
