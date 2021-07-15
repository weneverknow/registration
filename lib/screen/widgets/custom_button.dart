part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.text, this.color, this.onPress, this.width, Key? key})
      : super(key: key);
  final String text;
  final Color? color;
  final Function()? onPress;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? ScreenSize.screenWidth(context),
      margin: EdgeInsets.only(
          bottom: defaultPadding / 2,
          left: defaultPadding,
          right: defaultPadding),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color ?? Color(0xff90BEF8)),
          onPressed: onPress ?? () {},
          child: Text(text)),
    );
  }
}
