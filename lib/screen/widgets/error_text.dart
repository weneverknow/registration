part of 'widgets.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.red[600]),
      ),
    );
  }
}
