import 'package:flutter/material.dart';

import 'package:fl_components/themes/app_themes.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider & Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
                max: 400,
                min: 50,
                value: _sliderValue,
                activeColor: AppThemes.primary,
                onChanged: _sliderEnable == true
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                      }
                    : null),
            // Checkbox(
            //   value: _sliderEnable,
            //   onChanged: (value) {
            //     _sliderEnable = value ?? true;
            //     setState(() {});
            //   },
            // ),
            // Switch.adaptive(
            //   value: _sliderEnable,
            //   onChanged: (value) {
            //     _sliderEnable = value ?? true;
            //     setState(() {});
            //   },
            // ),
            // CheckboxListTile(
            //   title: const Text('Enable slider'),
            //   value: _sliderEnable,
            //   onChanged: (value) {
            //     _sliderEnable = value ?? true;
            //     setState(() {});
            //   },
            // ),

            SwitchListTile.adaptive(
              title: const Text('Enable slider'),
              value: _sliderEnable,
              onChanged: (value) {
                _sliderEnable = value;
                setState(() {});
              },
            ),
            // Image(
            //   image: const NetworkImage(
            //       'https://cdn130.picsart.com/277256569003211.png'),
            //   fit: BoxFit.contain,
            //   width: _sliderValue,
            // ),
            // Image(
            //   image: const NetworkImage(
            //       'https://static.wikia.nocookie.net/tonikaku-kawaii/images/5/5d/Tsukasa_Personaje.png/revision/latest?cb=20210607152210&path-prefix=es'),
            //   fit: BoxFit.contain,
            //   width: 450 - _sliderValue,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const NetworkImage(
                          'https://cdn130.picsart.com/277256569003211.png'),
                      fit: BoxFit.contain,
                      width: _sliderValue,
                    ),
                    Image(
                      image: const NetworkImage(
                          'https://static.wikia.nocookie.net/tonikaku-kawaii/images/5/5d/Tsukasa_Personaje.png/revision/latest?cb=20210607152210&path-prefix=es'),
                      fit: BoxFit.contain,
                      width: 450 - _sliderValue,
                    ),
                    Image(
                      image: const NetworkImage(
                          'https://static.wikia.nocookie.net/character-stats-and-profiles/images/8/89/Shinomiya.Kaguya.full.3277302.png/revision/latest?cb=20210831030650'),
                      fit: BoxFit.contain,
                      width: _sliderValue / 2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
