import 'package:flutter/material.dart';
import 'package:portfolio_stefun_1/screens/home_screen.dart';

// ignore: must_be_immutable
class AppBarActions extends StatelessWidget with GlobalKeys {
  final String title;
  final bool notSelected;
  AppBarActions({super.key, required this.title, required this.notSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        decoration: BoxDecoration(
            color: notSelected
                ? Colors.transparent
                : Colors.white.withOpacity(0.1),
            border: notSelected
                ? null
                : Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
            borderRadius: notSelected ? null : BorderRadius.circular(10.0),
            gradient: notSelected
                ? null
                : LinearGradient(colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.green.withOpacity(0.3)
                  ]),
            boxShadow: notSelected
                ? null
                : [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2.0,
                        offset: const Offset(1.0, 1.0))
                  ]),
        child: Text(title,
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5)));
  }
}
