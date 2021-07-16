part of 'widgets.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({required this.text, this.color, Key? key})
      : super(key: key);
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: color ?? Theme.of(context).textTheme.subtitle1!.color),
      overflow: TextOverflow.clip,
    );
  }
}
