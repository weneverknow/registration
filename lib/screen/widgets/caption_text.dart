part of 'widgets.dart';

class CaptionText extends StatelessWidget {
  const CaptionText({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
