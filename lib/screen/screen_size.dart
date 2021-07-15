import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  const ScreenSize({Key? key}) : super(key: key);

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
