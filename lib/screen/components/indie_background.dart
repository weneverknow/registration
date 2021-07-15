part of 'components.dart';

class IndieBackground extends StatelessWidget {
  const IndieBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            color: primaryColor,
          ),
        ),
        Flexible(
            child: Container(
          color: greyColor,
        ))
      ],
    );
  }
}
