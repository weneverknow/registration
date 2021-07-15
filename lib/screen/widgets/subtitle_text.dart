part of 'widgets.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
