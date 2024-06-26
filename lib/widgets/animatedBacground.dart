import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key, required this.child});
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  final List<Color> _colors = [
    Colors.black,
    Colors.deepPurple,
    Colors.black,
    Colors.green,
    Colors.black,
    Colors.grey,
    Colors.black,
    Colors.indigo,
  ];
  int _colorIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _colors[_colorIndex],
              _colors[(_colorIndex + 1) % _colors.length],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
