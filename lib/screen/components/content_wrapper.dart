part of 'components.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({required this.child, this.alignment, Key? key})
      : super(key: key);
  final Widget child;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Container(
//          color: Colors.red,
        width: ScreenSize.screenWidth(context),
        //height: ScreenSize.screenHeight(context) * 0.75,
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: child,
      ),
    );
  }
}
