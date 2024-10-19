import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedContainerApp());
}

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double boxHeight = 100;
  double boxWidth = 100;
  Color boxColor = Colors.deepPurple;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  final Random random = Random();

  void _changeBoxSizeAndColor() {
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
      boxHeight = random.nextInt(400).toDouble();
      boxColor = Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      ); // Random color
      _borderRadius = BorderRadius.circular(
          random.nextInt(50).toDouble()); // Random border radius
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed:
                  _changeBoxSizeAndColor, // Change size and color on button press
            ),
          ],
        ),
        body: Center(
          child: GestureDetector(
            onTap:
                _changeBoxSizeAndColor, // Change size and color on tapping the container
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: _borderRadius,
              ),
              child: Center(
                child: Text(
                  'Tap me!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
