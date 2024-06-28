import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShowShimmer extends StatelessWidget {
  final Widget widget;
  const ShowShimmer({super.key, required this.widget});
  @override
  Widget build(BuildContext context) => Shimmer(
        duration: const Duration(seconds: 1),
        color: Colors.red, //Default value
        colorOpacity: 0, //Default value
        enabled: true, //Default value
        direction: const ShimmerDirection.fromRTLB(), //Default Value
        child: widget,
      );
}

class MyBullet extends StatelessWidget {
  const MyBullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1a043a), Colors.white],
        ),
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({Key? key, required this.child}) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: _isHovered ? Colors.white : Colors.transparent, width: 3),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.transparent.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
