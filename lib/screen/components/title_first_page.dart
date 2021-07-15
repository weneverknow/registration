part of 'components.dart';

class TitleFirstPage extends StatelessWidget {
  const TitleFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Welcome to\n',
          style: bigTitleText.copyWith(
              fontSize: Theme.of(context).textTheme.headline3!.fontSize)),
      TextSpan(
          text: 'GIN',
          style: bigTitleText.copyWith(
              fontSize: Theme.of(context).textTheme.headline3!.fontSize)),
      TextSpan(
          text: ' Finans',
          style: bigTitleText.copyWith(
              fontSize: Theme.of(context).textTheme.headline3!.fontSize,
              color: secondaryColor))
    ]));
  }
}
