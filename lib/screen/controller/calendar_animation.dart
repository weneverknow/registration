import 'package:flutter/material.dart';

class CalendarAnimation {
  final AnimationController controller;
  final Animation<double> scaleAnimation;

  CalendarAnimation(this.controller)
      : scaleAnimation = Tween<double>(begin: 1, end: 1.6).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut));
}
