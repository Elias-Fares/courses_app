import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../controller/onboardingcontroller.dart';

class CustomPositioned extends StatelessWidget {
  final OnboardingController controller;
  final RiveAnimation animation;
  final double width;
  const CustomPositioned({
    super.key,
    required this.controller,
    required this.animation,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(width: this.width, height: this.width, child: animation),
    );
  }
}
