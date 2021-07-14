import 'package:flutter/material.dart';
import 'package:registration/screen/pages/pages.dart';
import 'package:registration/screen/widgets/widgets.dart';
import 'package:registration/theme/theme.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            FirstPage(),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(24, 50, 24, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 4,
                    color: Colors.black,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        4, (index) => CircleNumber(text: '${index + 1}')),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(text: 'NEXT'),
            )
          ],
        ),
      ),
    );
  }
}
