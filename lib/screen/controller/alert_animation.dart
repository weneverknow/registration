import 'package:flutter/material.dart';

class AlertAnimation {
  final AnimationController controller;
  final Animation<double> translateAnimation;
  final Animation<double> opacityAnimation;
  AlertAnimation(this.controller)
      : translateAnimation = Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)),
        opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
}
