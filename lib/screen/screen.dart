import 'package:flutter/material.dart';
import 'package:registration/screen/components/components.dart';
import 'package:registration/screen/pages/pages.dart';
import 'package:registration/screen/widgets/widgets.dart';
import 'package:registration/theme/theme.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        body: SafeArea(
          child: Stack(
            children: [
              IndieBackground(),
              PageView(
                controller: _pageController,
                children: [FirstPage(), SecondPage()],
              ),
              HeaderContainer(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4, (index) => CircleNumber(text: '${index + 1}')),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          text: 'NEXT',
        ));
  }
}
