import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';

class MyLoadingIndicator extends StatelessWidget {
  final double height;
  final Color color;

  const MyLoadingIndicator({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedLoadingJumpingDots(
      numberOfDots: 3,
      jumpingHeight: height * .0275,
      color: color,
      speed: const Duration(milliseconds: 500),
    );
  }
}
