part of 'components.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(24, 50, 24, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 4,
            color: Colors.black,
          ),
          child
        ],
      ),
    );
  }
}
