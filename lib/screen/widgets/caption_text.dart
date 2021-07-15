part of 'widgets.dart';

class CaptionText extends StatelessWidget {
  const CaptionText({required this.text, this.color, Key? key})
      : super(key: key);
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: color ?? Theme.of(context).textTheme.caption!.color),
    );
  }
}
