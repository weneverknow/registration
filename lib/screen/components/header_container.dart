part of 'components.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(24, 60, 24, 0),
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
            children: children,
          )
        ],
      ),
    );
  }
}
