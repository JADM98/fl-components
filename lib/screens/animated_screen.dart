import 'dart:math';
import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 100;
  double _heigth = 100;
  Color _color = AppThemes.primary;
  BorderRadius _borderRadius = BorderRadius.circular(12);

  void changeContainerShape() {
    final Random random = Random();
    _width = random.nextInt(250) + 50;
    _heigth = random.nextInt(250) + 50;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), 0.5 + 0.5 * random.nextDouble());
    _borderRadius = BorderRadius.circular(10 + 40 * random.nextDouble());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Animated Container')),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeContainerShape(),
        child: const Icon(
          Icons.play_circle_outline,
          size: 40,
        ),
      ),
    );
  }
}
