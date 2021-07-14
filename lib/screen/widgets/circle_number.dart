part of 'widgets.dart';

class CircleNumber extends StatelessWidget {
  const CircleNumber({required this.text, this.color, Key? key})
      : super(key: key);
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          shape: BoxShape.circle,
          color: color ?? Colors.white),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
