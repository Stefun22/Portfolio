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
