part of 'components.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FittedBox(
        child: Container(
//          color: Colors.red,
          width: ScreenSize.screenWidth(context),
          //height: ScreenSize.screenHeight(context) * 0.75,
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: child,
        ),
      ),
    );
  }
}
