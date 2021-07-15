part of 'components.dart';

class ClipperBackground extends StatelessWidget {
  const ClipperBackground({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: ScreenSize.screenWidth(context),
          height: (ScreenSize.screenHeight(context) * 0.8) - 62,
          color: greyColor,
          padding: EdgeInsets.fromLTRB(
              defaultPadding, (defaultPadding * 3), defaultPadding, 0),
          child: child,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 50);
    path.quadraticBezierTo(5, 5, 60, 0);
    path.lineTo(size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
